//
//  SigninFormValidator.swift
//  UserRegistrationModule
//
//  Created by Dev on 17/04/2023.
//

import Foundation

class SigninFormValidator {
    
    func isEmailValid(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    func isPasswordValid(_ password: String) -> Bool {
        return !password.isEmpty
    }

}
