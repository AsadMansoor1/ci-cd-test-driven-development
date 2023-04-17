//
//  SignupFormModel.swift
//  UserRegistrationModule
//
//  Created by Dev on 4/14/23.
//

import Foundation

struct SignupFormModel: Encodable {
    
    let firstName: String
    let lastName: String
    let email: String
    let password: String
}
