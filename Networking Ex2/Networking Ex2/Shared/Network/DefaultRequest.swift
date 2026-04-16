//
//  DefaultRequest.swift
//  Networking Ex2
//
//  Created by Gabriel Merenfeld on 16/04/26.
//

import Foundation

class DefaultRequest: GlobalRequestProtocol {
    func request(apiResquest: APIRequest, baseURL: String, timeout: TimeInterval) -> URLRequest? {
        let urlString = baseURL + apiResquest.endpoint
        
        guard let url = URL(string: urlString) else {
            return nil
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = apiResquest.httpMethod.rawValue
        request.timeoutInterval = timeout
        request.allHTTPHeaderFields = apiResquest.headers
        
        if let parameters = apiResquest.parameters {
            switch parameters {
                case .encodable(let encodable):
                    request.httpBody = try? JSONEncoder().encode(encodable)
                    
                case .dictionary(let dictionary):
                    request.httpBody = try? JSONSerialization.data(
                        withJSONObject: dictionary,
                        options: []
                    )
            }
        }
        
        return request
    }
}
