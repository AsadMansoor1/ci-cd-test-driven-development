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

    func testSignupView_WhenValidFirstNameProvide_ShouldReturnTrue() {
        
        //Arrange
        let sut = SignupView()
        
        //Act
        let isFirstNameValid = sut.isFirstNameValid("Asad")
        
        //Assert
        XCTAssertTrue(isFirstNameValid, "The isFirstNameValid() method should have returned TRUE for valid first name but has returned FALSE.")
    }
    
    func testSignupView_WhenTooShortFirstNameProvided_ShouldReturnFalse() {
        //Arrange
        let sut = SignupView()
        
        //Act
        let isFirstNameValid = sut.isFirstNameValid("Ad")
        
        //Assert
        XCTAssertTrue(isFirstNameValid, "The isFirstNameValid() method should have returned FALSE for first name shorter than 2 characters but has returned TRUE.")
    }
    
    func testSignupView_WhenValidLastNameProvide_ShouldReturnTrue() {
        
        //Arrange
        let sut = SignupView()
        
        //Act
        let isLastNameValid = sut.isLastNameValid("Asad")
        
        //Assert
        XCTAssertTrue(isLastNameValid, "The isLastNameValid() method should have returned TRUE for valid last name but has returned FALSE.")
    }
    
    func testSignupView_WhenTooShortLastNameProvided_ShouldReturnFalse() {
        //Arrange
        let sut = SignupView()
        
        //Act
        let isLastNameValid = sut.isLastNameValid("A")
        
        //Assert
        XCTAssertFalse(isLastNameValid, "The isLastNameValid() method should have returned FALSE for last name shorter than 2 characters but has returned TRUE.")
    }
    
    func testSignupView_WhenValidEmailProvided_ShouldReturnTrue() {
        
        //Arrange
        let sut = SignupView()
        
        //Act
        let isEmailValid = sut.isEmailValid("test@test.com")
        
        //Assert
        XCTAssertTrue(isEmailValid, "The isEmailValid() method should have returned TRUE for valid email but has returned FALSE.")
    }
    
    func testSignupView_WhenPasswordProvided_ShouldReturnTrue() {
        
        //Arrange
        let sut = SignupView()
        
        //Act
        let isPasswordValid = sut.isPasswordValid("12345678")
        
        //Assert
        XCTAssertTrue(isPasswordValid, "The isPasswordValid() method should have returned TRUE for valid password but has returned FALSE.")
    }
    
    func testSignupView_WhenTooShortPasswordProvided_ShouldReturnFalse() {
        
        //Arrange
        let sut = SignupView()
        
        //Act
        let isPasswordValid = sut.isPasswordValid("1234567")
        
        //Assert
        XCTAssertFalse(isPasswordValid, "The isPasswordValid() method should have returned FALSE for password shorter than 8 characters but has returned TRUE.")
    }
    
    func testSignupView_WhenConfirmPasswordProvided_ShouldMatchWithPassword() {
        
        //Arrange
        let sut = SignupView()
        
        //Act
        let doPasswordsMatch = sut.doConfirmPasswordMatch("12345678", "12345678")
        
        //Assert
        XCTAssertTrue(doPasswordsMatch, "The doConfirmPasswordMatch() method should have returned TRUE when Confirm Password is same is Password but has returned FALSE.")
    }
}
