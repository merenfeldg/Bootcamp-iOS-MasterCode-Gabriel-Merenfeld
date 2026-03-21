//
//  FormValidation.swift
//  MasterCine
//
//  Created by Gabriel Merenfeld on 13/03/26.
//

import Foundation

typealias FormResult = Result<Void, AuthError>

struct FormValidatorHelper {
    static func validateEmail(_ email: String) -> Bool {
        if case .failure = isEmptyField(text: email) {
            return false
        }
        if case .failure = isEmailFormatValid(email) {
            return false
        }
        
        return true
    }
    
    static func validatePassword(_ password: String) -> Bool {
        if case .failure = isEmptyField(text: password) {
            return false
        }
        if case .failure = isPasswordAtLeastEightCharacters(password) {
            return false
        }
        
        return true
    }
}

extension FormValidatorHelper {
    static func isEmptyField(text: String) -> FormResult {
        return text.isEmpty ? .failure(.emptyField) : .success(())
    }
    
    static func isEmailFormatValid(_ email: String) -> FormResult {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        
        return predicate.evaluate(with: email)
        ? .success(())
        : .failure(.invalidEmailFormat)
    }
    
    static func isPasswordAtLeastEightCharacters(_ password: String) -> FormResult {
        let haveMoreThanEightCharacters = password.count >= 8
        
        return haveMoreThanEightCharacters
        ? .success(())
        : .failure(.passwordFewerEightCaracters)
    }
}
