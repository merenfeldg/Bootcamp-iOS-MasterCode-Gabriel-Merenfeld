//
//  AuthError.swift
//  MasterCine
//
//  Created by Gabriel Merenfeld on 13/03/26.
//

enum AuthError: Error {
    case emptyField
    case invalidEmailFormat
    case passwordTooShort
}
