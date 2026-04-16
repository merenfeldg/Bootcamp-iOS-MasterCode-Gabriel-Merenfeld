//
//  APIRequest.swift
//  Networking Ex2
//
//  Created by Gabriel Merenfeld on 16/04/26.
//

struct APIRequest {
    let endpoint: String
    let httpMethod: HTTPMethod
    let headers: [String: String]?
    let parameters: TypeParameter?
    
    init(
        endpoint: String,
        httpMethod: HTTPMethod = .get,
        headers: [String : String]? = nil,
        parameters: TypeParameter? = nil,
    ) {
        self.endpoint = endpoint
        self.httpMethod = httpMethod
        self.headers = headers
        self.parameters = parameters
    }
}
