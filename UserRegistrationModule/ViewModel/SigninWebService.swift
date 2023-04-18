//
//  SigninWebService.swift
//  UserRegistrationModule
//
//  Created by Dev on 17/04/2023.
//

import Foundation

class SigninWebService {
    private var urlString: String
    private var urlSession: URLSessionProtocol

    init(urlString: String, urlSession: URLSessionProtocol = URLSession.shared) {
        self.urlString = urlString
        self.urlSession = urlSession
    }


    func processSignin(for signinFormModel: SigninFormModel) async -> Bool {
        guard let encoded = try? JSONEncoder().encode(signinFormModel) else {
            return false
        }

        let url = URL(string: SigninConstants.signinURL)!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        do {
            let (data, _) = try await urlSession.upload(for: request, from: encoded)
            // handle the result
            do {
                    let decodedResponse = try JSONDecoder().decode(LoginResponse.self, from: data)
                    print("Decoded response successfully: \(decodedResponse)")

                    // Save the token to UserDefaults
                    UserDefaults.standard.set(decodedResponse.token, forKey: "userToken")

                    // Return true to indicate a successful login
                    return true
            } catch {
                print("Failed to decode order: \(error)")
            }
        } catch {
            print("Checkout failed")
        }
        return false
    }
}


