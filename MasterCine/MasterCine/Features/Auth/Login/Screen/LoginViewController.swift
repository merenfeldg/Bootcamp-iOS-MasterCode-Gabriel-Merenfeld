//
//  ViewController.swift
//  MasterCine
//
//  Created by Gabriel Merenfeld on 12/03/26.
//

import UIKit

class LoginViewController: UIViewController {
    var screen: LoginScreen?
    var viewModel = LoginViewModel()
    
    override func loadView() {
        screen = LoginScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configProtocols()
    }
    
    func showAlertController(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okButton)
        present(alertController, animated: true)
    }
}

// MARK: - SCREEN PROTOCOL
extension LoginViewController: LoginScreenDelegateProtocol {
    func configProtocols() {
        screen?.delegate = self
        screen?.setTextFieldsDelegate(self)
        viewModel.delegate(self)
    }
    
    func tappedLoginPrimaryButton(login: LoginModel) {
        viewModel.validateLogin(login)
    }
    
    func tappedHaventAccountTerciaryButton() {}
}

// MARK: - VIEWMODEL PROTOCOL
extension LoginViewController: LoginViewModelDelegateProtocol {
    func loginFailed(message: String) {
        showAlertController(title: "ATENÇÃO!", message: message)
    }
    
    func loginSucceeded() {
        showAlertController(
            title: "PARABÉNS!",
            message: "Login feito com sucesso"
        )
    }
}

// MARK: - TEXTFIELD DELEGATE
extension LoginViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        // Ação que é executada após eu terminar de escrever no campo
    }
}
