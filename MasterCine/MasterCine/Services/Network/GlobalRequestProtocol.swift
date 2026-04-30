//
//  GlobalRequestProtocol.swift
//  MasterCine
//
//  Created by Gabriel Merenfeld on 24/04/26.
//

import Foundation

protocol GlobalRequestProtocol {
    func request(apiRequest: APIRequest, baseURL: String, timeout: TimeInterval) -> URLRequest?
}
