//
//  LoginViewModel.swift
//  MasterCine
//
//  Created by Gabriel Merenfeld on 21/03/26.
//

protocol LoginViewModelDelegateProtocol: AnyObject {
    func loginFailed(message: String)
    func loginSucceeded()
}

class LoginViewModel {
    private weak var delegate: LoginViewModelDelegateProtocol?
    
    func validateLogin(_ login: LoginModel) {
        guard FormValidatorHelper.validateEmail(login.email) else {
            delegate?.loginFailed(message: AuthError.invalidEmailFormat.description)
            return
        }
        
        guard FormValidatorHelper.validatePassword(login.password) else {
            delegate?.loginFailed(message: AuthError.invalidPassword.description)
            return
        }
        // TO DO: Criar Request
        delegate?.loginSucceeded()
    }
    
    func delegate(_ delegate: LoginViewModelDelegateProtocol) {
        self.delegate = delegate
    }
}
