//
//  ErrorHandler.swift
//  Networking Ex1
//
//  Created by Gabriel Merenfeld on 11/04/26.
//

struct ErrorHandler: Error {
    let message: String
    let statusCode: Int?
}
