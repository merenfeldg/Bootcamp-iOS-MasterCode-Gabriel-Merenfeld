//
//  Geolocation.swift
//  Networking Ex1
//
//  Created by Gabriel Merenfeld on 11/04/26.
//

struct Geolocation: Codable {
    let latitude: String
    let longitude: String
    
    private enum CodingKeys: String, CodingKey {
        case latitude = "lat"
        case longitude = "lng"
    }
}

