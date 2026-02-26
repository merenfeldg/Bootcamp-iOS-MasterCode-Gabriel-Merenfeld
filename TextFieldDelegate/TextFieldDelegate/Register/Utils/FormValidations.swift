//
//  FormValidations.swift
//  TextFieldDelegate
//
//  Created by Gabriel Merenfeld on 26/02/26.
//

import UIKit

class FormValidations {
    
    func isValidName(_ name: String) -> FormResult {
        
        if case .failure = isEmptyField(text: name) {
            return .failure(.invalidName)
        }
        
        return .success(true)
    }
    
    func isValidEmail(_ email: String) -> FormResult {
        
        if case .failure = isEmptyField(text: email) {
            return .failure(.invalidEmail)
        }
        if case .failure = isEmailFormatValid(email) {
            return .failure(.invalidEmail)
        }
        
        return .success(true)
    }
    
    func isValidPassword(_ password: String) -> FormResult {
        
        if case .failure = isEmptyField(text: password) {
            return .failure(.invalidPassword)
        }
        if case .failure = isPasswordAtLeastEightCharacters(password) {
            return .failure(.invalidPassword)
        }
        
        return .success(true)
    }
    
    func isValidConfirmPassword(password: String, otherPassword: String) -> FormResult {
        
        if case .failure = isValidPassword(password) {
            return .failure(.invalidPassword)
        }
        if case .failure = validatePasswordsMatch(password: password, otherPassword: otherPassword) {
            return .failure(.invalidPassword)
        }
        
        return .success(true)
    }
}


// MARK: - Utils Validations
extension FormValidations {
    
    private func isEmptyField(text: String) -> FormResult {
        return text.isEmpty ? .failure(.emptyField) : .success(true)
    }
    
    private func isEmailFormatValid(_ email: String) -> FormResult {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        
        return predicate.evaluate(with: email)
            ? .success(true)
            : .failure(.emailFormatInvalid)
    }
    
    private func isPasswordAtLeastEightCharacters(_ password: String) -> FormResult {
        
        let isPasswordAtLeastEightCharacters = password.count >= 8
        
        return isPasswordAtLeastEightCharacters
            ? .success(true)
            : .failure(.passwordTooShort)
    }
    
    private func validatePasswordsMatch(password: String, otherPassword: String) -> FormResult {
        
        return password == otherPassword
            ? .success(true)
            : .failure(.passwordsNotMatch)
    }
}
