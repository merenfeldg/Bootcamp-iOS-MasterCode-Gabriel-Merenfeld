//
//  FormValidation.swift
//  MasterCine
//
//  Created by Gabriel Merenfeld on 13/03/26.
//

import Foundation

typealias FormResult = Result<Bool, AuthError>

struct FormValidation {
    func validateEmail(_ email: String) -> FormResult {
        if case .failure = isEmptyField(text: email) {
            return .failure(.emptyField)
        }
        if case .failure = isEmailFormatValid(email) {
            return .failure(.invalidEmailFormat)
        }
        
        return .success(true)
    }
    
    func validatePassword(_ password: String) -> FormResult {
        if case .failure = isEmptyField(text: password) {
            return .failure(.emptyField)
        }
        if case .failure = isPasswordAtLeastEightCharacters(password) {
            return .failure(.passwordTooShort)
        }
        
        return .success(true)
    }
}

extension FormValidation {
    private func isEmptyField(text: String) -> FormResult {
        return text.isEmpty ? .failure(.emptyField) : .success(true)
    }
    
    private func isEmailFormatValid(_ email: String) -> FormResult {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        
        return predicate.evaluate(with: email)
        ? .success(true)
        : .failure(.invalidEmailFormat)
    }
    
    private func isPasswordAtLeastEightCharacters(_ password: String) -> FormResult {
        let haveMoreThanEightCharacters = password.count >= 8
        
        return haveMoreThanEightCharacters
        ? .success(true)
        : .failure(.passwordTooShort)
    }
}
