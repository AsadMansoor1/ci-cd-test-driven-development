//
//  MockURLProtocol.swift
//  UserRegistrationModuleTests
//
//  Created by Dev on 4/17/23.
//

import Foundation

class MockURLProtocol: URLProtocol {
    
    static var stubResponseData: Data?
    
    override class func canInit(with request: URLRequest) -> Bool {
        true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        request
    }
    
    override func startLoading() {
        self.client?.urlProtocol(self, didLoad: MockURLProtocol.stubResponseData ?? Data())
        
        self.client?.urlProtocolDidFinishLoading(self)
    }
    override func stopLoading() {
        
    }
}
