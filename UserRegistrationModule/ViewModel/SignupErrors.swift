//
//  SignupErrors.swift
//  UserRegistrationModule
//
//  Created by Dev on 4/14/23.
//

import Foundation

enum SignupErrors: LocalizedError, Equatable {
    
    case responseModelParsingError
    case invalidRequestURLError
    
    case failedRequest(description:String)
    
    var errorDescription: String? {
        switch self {
        case .failedRequest(let description):
            return description
        case .responseModelParsingError, .invalidRequestURLError:
            return ""
        }
    }
}

