//
//  MockURLProtocolSignin.swift
//  UserRegistrationModuleTests
//
//  Created by Dev on 18/04/2023.
//

import Foundation


//class MockURLProtocolSignin: URLProtocol {
//
//    static var stubResponseData: Data?
//
//    override class func canInit(with request: URLRequest) -> Bool {
//        true
//    }
//
//    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
//        request
//    }
//
//    override func startLoading() {
//        self.client?.urlProtocol(self, didLoad: MockURLProtocolSignin.stubResponseData ?? Data())
//
//        self.client?.urlProtocolDidFinishLoading(self)
//    }
//    override func stopLoading() {
//
//    }
//}


class MockURLSession: URLSessionProtocol {
    var mockData: Data?
    var mockResponse: URLResponse?

    func upload(for request: URLRequest, from bodyData: Data) async throws -> (Data, URLResponse) {
        if let data = mockData, let response = mockResponse {
            return (data, response)
        } else {
            throw NSError(domain: "MockURLSession", code: 1, userInfo: nil)
        }
    }
}
