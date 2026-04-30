//
//  GlobalRequestProtocol2.swift
//  Networking Ex2
//
//  Created by Gabriel Merenfeld on 19/04/26.
//

import Foundation

protocol GlobalRequestProtocol2 {
    func request(apiRequest: APIRequest2, baseURL: String, timeout: TimeInterval) -> URLRequest?
}
