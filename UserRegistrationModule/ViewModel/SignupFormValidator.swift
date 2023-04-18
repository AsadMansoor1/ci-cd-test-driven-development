//
//  SignupFormValidator.swift
//  UserRegistrationModule
//
//  Created by Dev on 4/14/23.
//

import Foundation

class SignupFormValidator {
    
    func isFirstNameValid(_ name: String) -> Bool {
        return name.count >= SignupConstants.firstNameMinLength
    }
    
    func isLastNameValid(_ name: String) -> Bool {
        return name.count >= SignupConstants.lastNameMinLength
    }
    
    func isEmailValid(_ email: String) -> Bool {
        return NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: email)
    }
    
    func isPasswordValid(_ password: String) -> Bool {
        return password.count >= SignupConstants.passwordMinLength
    }
    
    func doConfirmPasswordMatch(_ password: String, _ confirmPassword: String) -> Bool {
        return password == confirmPassword
    }
}
