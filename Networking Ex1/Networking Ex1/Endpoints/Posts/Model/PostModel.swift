//
//  PostModel.swift
//  Networking Ex1
//
//  Created by Gabriel Merenfeld on 11/04/26.
//

struct PostModel: Decodable {
    let id: Int
    let title: String
    let body: String
}

typealias PostList = [PostModel]
