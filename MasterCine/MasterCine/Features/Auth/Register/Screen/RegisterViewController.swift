//
//  RegisterViewController.swift
//  MasterCine
//
//  Created by Gabriel Merenfeld on 21/03/26.
//

import UIKit

class RegisterViewController: UIViewController {
    var screen: RegisterScreen?
    var viewModel = RegisterViewModel()
    
    override func loadView() {
        screen = RegisterScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configProtocols()
    }
    
    private func configProtocols() {
        screen?.delegate = self
        screen?.setTextFieldsDelegate(self)
        viewModel.delegate(self)
    }
    
    func showAlertController(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okButton)
        present(alertController, animated: true)
    }
}

// MARK: - VIEW MODEL PROTOCOL
extension RegisterViewController: RegisterViewModelDelegateProtocol {
    func registerFailed(message: String) {
        showAlertController(title: "ATENÇÃO", message: message)
    }
    
    func registerSucceeded() {
        showAlertController(title: "PARABÉNS", message: "Registro feito com sucesso!")
    }
}

//MARK: - SCREEN PROTOCOL
extension RegisterViewController: RegisterScreenDelegateProtocol {
    func tappedCreateAccountPrimaryButton(register: RegisterModel) {
        viewModel.validadeRegister(register)
    }
    
    func tappedHaveAnAccountTerciaryButton() {
        
    }
}

// MARK: - TEXT FIELD PROTOCOL
extension RegisterViewController: UITextFieldDelegate { }
