//
//  LoginViewController.swift
//  Navegação ViewCode
//
//  Created by Gabriel Merenfeld on 20/02/26.
//

import UIKit

class LoginViewController: UIViewController {

    private let contentView: LoginScreen
    
    init(contentView: LoginScreen) {
        self.contentView = contentView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        setupViewController()
    }
    
    private func setupViewController() {
        contentView.delegate(self)
    }
}

//MARK: - Configuration Actions
extension LoginViewController: LoginScreenDelegateProtocol {
    
    func tappedLoginPrimaryButton() {
        doNothing()
    }
    
    func tappedIAlreadyHaveAnAccountSecundaryButton() {
        goToRegisterScreen()
    }
    
    private func goToRegisterScreen() {
        navigationController?.pushViewController(
            DependecyInjector.madeRegisterViewControllerDependecy,
            animated: true
        )
    }
    private func doNothing() {}
}
