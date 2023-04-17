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
        
        guard let signupUrl = URL(string: self.urlString) else {
            completionHandler(nil, SignupErrors.invalidRequestURLError)
            return
        }
        
        
        var urlRequest = URLRequest(url: signupUrl)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("Content-Type", forHTTPHeaderField: "application/json")
        urlRequest.httpBody = try? JSONEncoder().encode(signupFormModel)
        
        let dataTask = self.urlSession.dataTask(with: urlRequest) { data, response, error in
            
            if let signupError = error {
                completionHandler(nil, SignupErrors.failedRequest(description: signupError.localizedDescription))
                return
            }

            if let data = data, let responseModel = try? JSONDecoder().decode(SignupResponseModel.self, from: data), let _ = responseModel.status {
                
                completionHandler(responseModel, nil)
            } else {
                completionHandler(nil, SignupErrors.responseModelParsingError)
            }
        }
        dataTask.resume()
    }
    
}
