//
//  RegisterViewModel.swift
//  MasterCine
//
//  Created by Gabriel Merenfeld on 21/03/26.
//

protocol RegisterViewModelDelegateProtocol: AnyObject {
    func registerFailed(message: String)
    func registerSucceeded()
}

class RegisterViewModel {
    private weak var delegate: RegisterViewModelDelegateProtocol?
    
    func validadeRegister(_ register: RegisterModel) {
        guard FormValidatorHelper.validateEmail(register.email) else {
            delegate?.registerFailed(message: AuthError.invalidEmail.description)
            return
        }
        guard FormValidatorHelper.validatePassword(register.password) else {
            delegate?.registerFailed(message: AuthError.invalidPassword.description)
            return
        }
        guard FormValidatorHelper.validateConfirmPassword(password: register.password, confirmPassword: register.confirmPassword) else {
            delegate?.registerFailed(message: AuthError.passwordNotMatchConfirmPassword.description)
            return
        }
        
        delegate?.registerSucceeded()
    }
    
    func delegate(_ delegate: RegisterViewModelDelegateProtocol) {
        self.delegate = delegate
    }
}
