//
//  RegisterError.swift
//  TextFieldDelegate
//
//  Created by Gabriel Merenfeld on 26/02/26.
//

enum RegisterError: Error {
    
    case emptyField
    
    case invalidEmail
    case emailFormatInvalid
    
    case invalidPassword
    case invalidName
    
    case passwordsNotMatch
    case passwordTooShort
}
