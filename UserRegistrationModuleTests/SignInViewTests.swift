//
//  SignInViewTests.swift
//  UserRegistrationModuleTests
//
//  Created by Dev on 13/04/2023.
//

import XCTest
@testable import UserRegistrationModule

final class SignInViewTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testSignInView_WhenValidEmailProvide_ShouldReturnTrue() {
        //Arrange
        let sut = SignInView()
        
        //Act
        let isEmailValid = sut.isEmailValid("shahidarshad@gmail.com")
        
        //Assert
        XCTAssertTrue(isEmailValid, "The isEmailValid() method should have returned TRUE for valid Email but has returned FALSE.")
    }
    
    func testSignInView_WhenValidPasswordProvide_ShouldReturnTrue() {
        //Arrange
        let sut = SignInView()
        
        //Act
        let isPasswordValid = sut.isPasswordValid("password")
        
        //Assert
        XCTAssertTrue(isPasswordValid, "The isPasswordValid() method should have returned TRUE for valid Password but has returned FALSE.")
    }
}
