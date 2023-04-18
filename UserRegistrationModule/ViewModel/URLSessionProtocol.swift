//
//  URLSessionProtocol.swift
//  UserRegistrationModuleTests
//
//  Created by Dev on 18/04/2023.
//

import Foundation

protocol URLSessionProtocol {
    func upload(for request: URLRequest, from bodyData: Data) async throws -> (Data, URLResponse)
}

extension URLSession: URLSessionProtocol {
    func upload(for request: URLRequest, from bodyData: Data) async throws -> (Data, URLResponse) {
        return try await self.upload(for: request, from: bodyData)
    }
}
