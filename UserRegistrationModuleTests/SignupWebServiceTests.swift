//
//  SignupWebServiceTests.swift
//  UserRegistrationModuleTests
//
//  Created by Dev on 4/14/23.
//

import XCTest
@testable import UserRegistrationModule

final class SignupWebServiceTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testSignupWebService_WhenRecieveSuccessfulResponse_ReturnsSuccess() {
        
        //Arrange
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: config)
        let jsonString = "{\"status\":\"ok\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        
        let signupWebService = SignupWebService(urlString: SignupConstants.signupURL, urlSession: urlSession)
        
        let signupExpectation = expectation(description: "Signup user expectation.")
        let signupFormModel = SignupFormModel(firstName: "Asad", lastName: "Mehmood", email: "test@test.com", password: "12345678")
        
        //Act
        signupWebService.processSignup(signupFormModel: signupFormModel) { (signupResponseModel, error) in 
            
            // Take response model from backend team
            //{"status": "ok"}
            
            XCTAssertEqual(signupResponseModel?.status, "ok", "SignupResponseModel should have ok status but it is not")
            signupExpectation.fulfill()
        }
        
        self.wait(for: [signupExpectation], timeout: 3)
        //Assert
    }
}
