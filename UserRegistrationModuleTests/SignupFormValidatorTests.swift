//
//  SignupViewTests.swift
//  UserRegistrationModuleTests
//
//  Created by Dev on 4/13/23.
//

import XCTest
@testable import UserRegistrationModule

final class SignupFormValidatorTests: XCTestCase {

    var sut: SignupFormValidator!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = SignupFormValidator()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }

    func testSignupView_WhenValidFirstNameProvide_ShouldReturnTrue() {
        
        //Arrange
        
        //Act
        let isFirstNameValid = sut.isFirstNameValid("Asad")
        
        //Assert
        XCTAssertTrue(isFirstNameValid, "The isFirstNameValid() method should have returned TRUE for valid first name but has returned FALSE.")
    }
    
<<<<<<< Updated upstream
    func testSignupView_WhenTooShortFirstNameProvided_ShouldReturnFalse() {
        //Arrange
        
        //Act
        let isFirstNameValid = sut.isFirstNameValid("Ad")
        
        //Assert
        XCTAssertTrue(isFirstNameValid, "The isFirstNameValid() method should have returned FALSE for first name shorter than \(SignupConstants.firstNameMinLength) characters but has returned TRUE.")
    }
    
    func testSignupView_WhenValidLastNameProvide_ShouldReturnTrue() {
        
        //Arrange
        
        //Act
        let isLastNameValid = sut.isLastNameValid("Asad")
        
        //Assert
        XCTAssertTrue(isLastNameValid, "The isLastNameValid() method should have returned TRUE for valid last name but has returned FALSE.")
    }
    
    func testSignupView_WhenTooShortLastNameProvided_ShouldReturnFalse() {
        
        //Arrange
        
        //Act
        let isLastNameValid = sut.isLastNameValid("A")
        
        //Assert
        XCTAssertFalse(isLastNameValid, "The isLastNameValid() method should have returned FALSE for last name shorter than \(SignupConstants.lastNameMinLength) characters but has returned TRUE.")
    }
    
    func testSignupView_WhenValidEmailProvided_ShouldReturnTrue() {
        
        //Arrange
        
        //Act
        let isEmailValid = sut.isEmailValid("test@test.com")
        
        //Assert
        XCTAssertTrue(isEmailValid, "The isEmailValid() method should have returned TRUE for valid email but has returned FALSE.")
    }
    
    func testSignupView_WhenPasswordProvided_ShouldReturnTrue() {
        
        //Arrange
        
        //Act
        let isPasswordValid = sut.isPasswordValid("12345678")
        
        //Assert
        XCTAssertTrue(isPasswordValid, "The isPasswordValid() method should have returned TRUE for valid password but has returned FALSE.")
    }
    
    func testSignupView_WhenTooShortPasswordProvided_ShouldReturnFalse() {
        
        //Arrange
        
        //Act
        let isPasswordValid = sut.isPasswordValid("1234567")
        
        //Assert
        XCTAssertFalse(isPasswordValid, "The isPasswordValid() method should have returned FALSE for password shorter than \(SignupConstants.passwordMinLength) characters but has returned TRUE.")
    }
    
    func testSignupView_WhenConfirmPasswordProvided_ShouldMatchWithPassword() {
        
        //Arrange
        
        //Act
        let doPasswordsMatch = sut.doConfirmPasswordMatch("12345678", "12345678")
        
        //Assert
        XCTAssertTrue(doPasswordsMatch, "The doConfirmPasswordMatch() method should have returned TRUE when Confirm Password is same is Password but has returned FALSE.")
    }
=======
    
>>>>>>> Stashed changes
}
