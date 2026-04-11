//
//  PostModel.swift
//  Networking Ex1
//
//  Created by Gabriel Merenfeld on 11/04/26.
//

struct PostModel: Codable {
    let id, userId: Int
    let title, body: String
}

typealias PostList = [PostModel]
