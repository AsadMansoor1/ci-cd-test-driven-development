//
//  SignupResponseModel.swift
//  UserRegistrationModule
//
//  Created by Dev on 4/14/23.
//

import Foundation

struct SignupResponseModel : Decodable {
    
    let status : String?
    
    init?(data: Data) {
        do {
            if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any] {
                self.status = json["status"] as? String
                return
            }
        } catch {
            print("Error deserializing JSON: \(error)")
        }
        status = nil
    }
}
