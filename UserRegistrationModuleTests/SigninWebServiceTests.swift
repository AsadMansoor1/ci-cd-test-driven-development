//
//  SigninWebServiceTests.swift
//  UserRegistrationModuleTests
//
//  Created by Dev on 18/04/2023.
//

import XCTest
@testable import UserRegistrationModule


final class SigninWebServiceTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testProcessSignin() async {
            // Given
        let mockURLSession = MockURLSession()
        let webService = SigninWebService(urlString: "https://example.com", urlSession: mockURLSession)

        let signinFormModel = SigninFormModel(email: "test@example.com", password: "password")

        let loginResponse = LoginResponse(token: "test_token")
        let jsonData = try! JSONEncoder().encode(loginResponse)
        mockURLSession.mockData = jsonData
        mockURLSession.mockResponse = HTTPURLResponse(url: URL(string: "https://example.com")!, statusCode: 200, httpVersion: nil, headerFields: nil)

        // When
        let result = await webService.processSignin(for: signinFormModel)

        // Then
        XCTAssertTrue(result, "Signin should succeed with the correct response.")
        XCTAssertEqual(UserDefaults.standard.string(forKey: "userToken"), "test_token", "The token should be saved in UserDefaults.")
    }
}
