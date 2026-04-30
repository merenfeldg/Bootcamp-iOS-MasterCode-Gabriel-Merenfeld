//
//  APIRequest.swift
//  MasterCine
//
//  Created by Gabriel Merenfeld on 24/04/26.
//

import Foundation

final class APIRequest {
    let endpoint: String
    let httpMethod: HTTPMethod
    let timeout: TimeInterval
    let headers: [String: String]?
    let parameters: TypeParameter?
    
    init(
        endpoint: String,
        httpMethod: HTTPMethod = .get,
        timeout: TimeInterval = 6,
        headers: [String : String]? = nil,
        parameters: TypeParameter? = nil
    ) {
        self.endpoint = endpoint
        self.httpMethod = httpMethod
        self.timeout = timeout
        self.headers = headers
        self.parameters = parameters
    }
}
