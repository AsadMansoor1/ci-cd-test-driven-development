//
//  SignupWebServiceTests.swift
//  UserRegistrationModuleTests
//
//  Created by Dev on 4/14/23.
//

import XCTest
@testable import UserRegistrationModule

final class SignupWebServiceTests: XCTestCase {
    
    var sut: SignupWebService!
    var signupFormModel: SignupFormModel!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: config)
        sut = SignupWebService(urlString: SignupConstants.signupURL, urlSession: urlSession)
        signupFormModel = SignupFormModel(firstName: "Asad", lastName: "Mehmood", email: "test@test.com", password: "12345678")
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        sut = nil
        signupFormModel = nil
        MockURLProtocol.stubResponseData = nil
        MockURLProtocol.error = nil
    }
    
    func testSignupWebService_WhenRecieveSuccessfulResponse_ReturnsSuccess() {
        
        //Arrange
        let jsonString = "{\"status\":\"ok\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        let signupExpectation = expectation(description: "Successful Signup user expectation.")
        
        //Act
        sut.processSignup(signupFormModel: signupFormModel) { (signupResponseModel, error) in
            
            // Take response model from backend team
            //{"status": "ok"}
            
            XCTAssertEqual(signupResponseModel?.status, "ok", "SignupResponseModel should have ok status but it is not")
            signupExpectation.fulfill()
        }
        
        self.wait(for: [signupExpectation], timeout: 3)
        //Assert
    }
    func testSignupWebService_WhenRecieveDifferentJSONResponse_ErrorTookPlace() {
        
        //Arrange
        let jsonString = "{\"message\":\"Internal system error\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        let signupExpectation = expectation(description: "Signup() method expectation for a response that contains different JSON structure.")
        
        //Act
        sut.processSignup(signupFormModel: signupFormModel) { (signupResponseModel, error) in
            
            // Take response model from backend team
            //{"status": "ok"}
            
            XCTAssertNil(signupResponseModel, "SignupResponseModel was expected to be nil when invalid JSON response returned but it is not nil")
            XCTAssertEqual(error, SignupErrors.responseModelParsingError, "ResponseModelParsingError was expected when invalid json parsed but it is some other error.")
            signupExpectation.fulfill()
        }
        
        self.wait(for: [signupExpectation], timeout: 3)
        //Assert
    }
    
    func testSignupWebService_WhenEmptyUrlProvided_ReturnsError() {
        
        //Arrange
        let signupExpectation = self.expectation(description: "An empty URL signup expectation.")
        sut = SignupWebService(urlString: "")
        
        //Act
        sut.processSignup(signupFormModel: signupFormModel) { (signupResponseModel, error) in
            
            //Assert
            XCTAssertEqual(error, SignupErrors.invalidRequestURLError, "ProcessSignup() method should have returned an error InvalidRequestURLError when empty URL provided")
            signupExpectation.fulfill()
        }
        
        self.wait(for: [signupExpectation], timeout: 2)
    }
    
    func testSignupWebService_WhenURLRequestFail_ReturnsError() {
        
        //Arrange
        let expectation = self.expectation(description: "Signup failure expectation.")
        let errorDescription = "A localized description of an error."
        
        MockURLProtocol.error = SignupErrors.failedRequest(description: errorDescription)
        
        //Act
        sut.processSignup(signupFormModel: signupFormModel) { signupResponseModel, error in
            
            //Assert
            XCTAssertEqual(error, SignupErrors.failedRequest(description: errorDescription))
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 2)
    }
}
