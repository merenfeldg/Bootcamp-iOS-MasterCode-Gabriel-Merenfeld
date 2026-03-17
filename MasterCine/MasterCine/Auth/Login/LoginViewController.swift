//
//  ViewController.swift
//  MasterCine
//
//  Created by Gabriel Merenfeld on 12/03/26.
//

import UIKit

class LoginViewController: UIViewController {
    private var screen: LoginScreen?
    private let formValidation = FormValidation()
    private var loginModel = LoginModel()
    
    private var numberValidForms: Int = 0
    private let numberForms: Int = 4
    
    private lazy var textFieldsBindingModel: [(textField: UITextField?, updateLoginModel: (String) -> Void)] = [
        (screen?.emailTextField, { [weak self] text in
            self?.loginModel.email = text
        }),
        (screen?.passwordTextField, { [weak self] text in
            self?.loginModel.password = text
        }),
    ]
    
    override func loadView() {
        screen = LoginScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configProtocols()
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateLoginModel(from: textField)
        validateTextField(textField)
    }
}

extension LoginViewController: LoginScreenDelegateProtocol {
    
    func configProtocols() {
        screen?.delegate(self)
        screen?.setTextFieldsDelegate(self)
    }
    
    func tappedLoginPrimaryButton() {}
    
    func tappedHaventAccountTerciaryButton() {}
}

extension LoginViewController {
    
    func validateTextField(_ textField: UITextField) {
        guard
            let textFieldType = LoginTextFieldType(rawValue: textField.tag)
        else { return }
        
        switch textFieldType {
            case .email:
                let result = formValidation.validateEmail(loginModel.email)
                handleValidationResult(result, from: textField)
            case .password:
                let result = formValidation.validatePassword(loginModel.password)
                handleValidationResult(result, from: textField)
        }
    }
    
    private func handleValidationResult(_ result: FormResult, from textField: UITextField) {
        switch result {
            case .success:
                numberValidForms += 1
                screen?.showCorrectBorderTextField(textField)
            case .failure:
                screen?.showIncorrectBorderTextField(textField)
        }
    }
    
    private func updateLoginModel(from textField: UITextField) {
        guard let text = textField.text else { return }
        
        textFieldsBindingModel
            .first { $0.textField == textField}?
            .updateLoginModel(text)
    }
}
