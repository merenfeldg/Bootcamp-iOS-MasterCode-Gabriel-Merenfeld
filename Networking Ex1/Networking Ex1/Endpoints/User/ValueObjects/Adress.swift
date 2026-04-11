//
//  Adress.swift
//  Networking Ex1
//
//  Created by Gabriel Merenfeld on 11/04/26.
//

struct Adress: Codable {
    let street: String
    let suite: String
    let city: String
    let zipCode: String
    let geolocation: Geolocation
    
    private enum CodingKeys: String, CodingKey {
        case street, suite, city
        case zipCode = "zipcode"
        case geolocation = "geo"
    }
}
