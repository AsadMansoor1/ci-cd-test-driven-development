//
//  SignupViewTests.swift
//  UserRegistrationModuleTests
//
//  Created by Dev on 4/13/23.
//

import XCTest
@testable import UserRegistrationModule

final class SignupViewTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSignupView_WhenSignupProcessInvoked_FirstNameShouldBeAvailable() {
        
        //Arrange
        let sut = SignupView()
        
        //Act
        let isFirstNameValid = sut.isFirstNameValid("Asad")
        
        //Assert
        XCTAssertTrue(isFirstNameValid, "The isFirstNameValid() method should have returned TRUE for valid first name but has returned FALSE.")
    }
}
