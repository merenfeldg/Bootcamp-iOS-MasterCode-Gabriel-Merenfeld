//
//  UserModel.swift
//  Networking Ex1
//
//  Created by Gabriel Merenfeld on 11/04/26.
//

struct UserModel: Codable {
    let id: Int
    let name, username: String
    let email: String
    let adress: Adress
    let phone: String
    let website: String
    let company: Company
}
