//
//  ViewController.swift
//  TextFieldDelegate
//
//  Created by Gabriel Merenfeld on 25/02/26.
//

import UIKit

class RegisterViewController: UIViewController {

    private var contentView: RegisterScreen?
    private var formValidation = FormValidations()
    private var registerModel = RegisterModel()

    private var numberValidForms: Int = 0
    private let numberForms: Int = 4
    
    private lazy var textFieldBindingsModel: [(textField: UITextField?, updateRegisterModel: (String) -> Void)] = [
        (contentView?.nameTextField, { [weak self] text in
            self?.registerModel.name = text
        }),
        (contentView?.emailTextField, { [weak self] text in
            self?.registerModel.email = text
        }),
        (contentView?.passwordTextField, { [weak self] text in
            self?.registerModel.password = text
        }),
        (contentView?.confirmPasswordTextField, { [weak self] text in
            self?.registerModel.confirmPassword = text
        }),
    ]
    
    override func loadView() {
        contentView = RegisterScreen()
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        contentView?.delegate(self)
        contentView?.setTextFieldsDelegate(self)
    }
}

extension RegisterViewController: RegisterScreenDelegate {
    func tappedPrimaryButton() {
        
    }
}

// MARK: - UITextFieldDelegate
extension RegisterViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        contentView?.selectTextField(textField)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateRegisterModel(from: textField)
        validateTextField(textField)
        verifyAllFormsIsValid()
    }
    
    private func verifyAllFormsIsValid() {
        if isFormValid() {
            contentView?.enabledButton = true
            contentView?.primaryButton.isEnabled = true
        }
    }
}

// MARK: - Validation TextFields
extension RegisterViewController {
    
    func isFormValid() -> Bool {
        return numberValidForms == numberForms
    }
    
    func validateTextField(_ textField: UITextField) {
        guard
            let textFieldType = TextFieldType(rawValue: textField.tag)
        else { return }
        
        switch textFieldType {
            case .name:
                let result = formValidation.isValidName(registerModel.name)
                handleValidationResult(result, from: textField)
            
            case .email:
                let result = formValidation.isValidEmail(registerModel.email)
                handleValidationResult(result, from: textField)
            
            case .password:
                let result = formValidation.isValidPassword(registerModel.password)
                handleValidationResult(result, from: textField)
            
            case .confirmPassword:
                let result = formValidation.isValidConfirmPassword(
                    password: registerModel.password,
                    otherPassword: registerModel.confirmPassword
                )
                handleValidationResult(result, from: textField)
        }
    }
    
    private func handleValidationResult(_ result: FormResult, from textField: UITextField) {
        switch result {
            case .success:
                numberValidForms += 1
                contentView?.showCorrectBorderTextField(textField)
            
            case .failure:
                contentView?.showIncorrectBorderTextField(textField)
        }
    }
    
    private func updateRegisterModel(from textField: UITextField) {
        guard let text = textField.text else { return }

//                       DEPOIS
        textFieldBindingsModel
            .first { $0.textField === textField }?
            .updateRegisterModel(text)
        
//                        ANTES
//        if textField === contentView?.nameTextField {
//            registerModel.name = textField.text ?? ""
//        }
//        if textField === contentView?.emailTextField {
//            registerModel.email = textField.text ?? ""
//        }
//        if textField === contentView?.passwordTextField {
//            registerModel.password = textField.text ?? ""
//        }
//        if textField === contentView?.confirmPasswordTextField {
//            registerModel.confirmPassword = textField.text ?? ""
//        }
    }
}
