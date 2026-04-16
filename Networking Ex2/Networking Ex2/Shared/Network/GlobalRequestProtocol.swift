//
//  GlobalRequestProtocol.swift
//  Networking Ex2
//
//  Created by Gabriel Merenfeld on 16/04/26.
//

import Foundation

protocol GlobalRequestProtocol {
    func request(apiResquest: APIRequest, baseURL: String, timeout: TimeInterval) -> URLRequest?
}
