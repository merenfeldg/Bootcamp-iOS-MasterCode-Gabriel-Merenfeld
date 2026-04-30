//
//  APIRequest.swift
//  Networking Ex2
//
//  Created by Gabriel Merenfeld on 19/04/26.
//

struct APIRequest2 {
    let endpoint: String
    let httpMethod: HTTPMethod2
    let parameter: TypeParameter2?
    let header: [String: String]?
    
    init(
        endpoint: String,
        httpMethod: HTTPMethod2 = .get,
        parameter: TypeParameter2? = nil,
        header: [String : String]? = nil
    ) {
        self.endpoint = endpoint
        self.httpMethod = httpMethod
        self.parameter = parameter
        self.header = header
    }
}
