//
//  AuthError.swift
//  MasterCine
//
//  Created by Gabriel Merenfeld on 13/03/26.
//

enum AuthError: Error {
    case emptyField
    case invalidEmailFormat
    case passwordFewerEightCaracters
    case invalidEmail
    case invalidPassword
    
    var description: String {
        switch self {
            case .emptyField: "Campo não pode ser vazio"
            case .invalidEmailFormat: "Email com formato inválido"
            case .passwordFewerEightCaracters: "Senha precisa ter no mínimo 8 caracteres"
            case .invalidEmail: "Digite um e-mail válido"
            case .invalidPassword: "Digite uma senha válida"
        }
    }
}
