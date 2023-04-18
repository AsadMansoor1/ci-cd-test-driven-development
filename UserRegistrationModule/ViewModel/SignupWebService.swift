//
//  SignupWebService.swift
//  UserRegistrationModule
//
//  Created by Dev on 4/14/23.
//

import Foundation

class SignupWebService {
    
    private var urlString: String
    private var urlSession: URLSession
    
    init(urlString: String, urlSession: URLSession = .shared) {
        self.urlString = urlString
        self.urlSession = urlSession
    }
    
    func processSignup(signupFormModel: SignupFormModel, completionHandler: @escaping (SignupResponseModel?, SignupErrors?) -> Void) {
        
        guard let signupUrl = URL(string: SignupConstants.signupURL) else {
            // TODO: - Write a unit test that will return a specific error when url in nil.
            return
        }
        
        var urlRequest = URLRequest(url: signupUrl)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("Content-Type", forHTTPHeaderField: "application/json")
        urlRequest.httpBody = try? JSONEncoder().encode(signupFormModel)
        
        let dataTask = self.urlSession.dataTask(with: urlRequest) { data, response, error in
            
            // TODO: - Write a unit test to handle error.

            if let data = data, let responseModel = SignupResponseModel(data: data) {
                
                completionHandler(responseModel, nil)
            } else {
                completionHandler(nil, SignupErrors.responseModelParsingError)
            }
        }
        dataTask.resume()
    }
    
}
