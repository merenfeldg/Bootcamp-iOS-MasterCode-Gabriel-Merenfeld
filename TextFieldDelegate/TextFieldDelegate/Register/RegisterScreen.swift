//
//  RegisterScreen.swift
//  TextFieldDelegate
//
//  Created by Gabriel Merenfeld on 25/02/26.
//

import UIKit

protocol RegisterScreenDelegate: AnyObject {
    func tappedPrimaryButton()
}

class RegisterScreen: UIView {
    
    private weak var delegate: RegisterScreenDelegate?
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Fazer Cadastro"
        label.font = .boldSystemFont(ofSize: 24)
        label.textColor = .black
        
        return label
    }()
    
    lazy var nameTextField: UITextField = {
        let textField = CustomTextField()
        
        textField.placeholder = "Digite seu nome completo..."
        
        return textField
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = CustomTextField()
        
        textField.placeholder = "Digite seu email..."
        textField.keyboardType = .emailAddress
        
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = CustomTextField()
        
        textField.placeholder = "Digite sua senha..."
        textField.isSecureTextEntry = true
        
        return textField
    }()
    
    lazy var confirmPasswordTextField: UITextField = {
        let textField = CustomTextField()
        
        textField.placeholder = "Confirme sua senha..."
        textField.isSecureTextEntry = true
        
        return textField
    }()
    
    lazy var primaryButton: UIButton = {
        let button = CustomPrimaryButton()
        
        button.setTitle("Login", for: .normal)
        button.addTarget(self, action: #selector(primaryButtonAction), for: .touchUpInside)
        
        return button
    }()
    
    func delegate(_ delegate: RegisterScreenDelegate) {
        self.delegate = delegate
    }
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func primaryButtonAction() {
        delegate?.tappedPrimaryButton()
    }
}

extension RegisterScreen {
    
    private func setupView() {
        backgroundColor = .white
        addElements()
        disableAutoresizingMaskInAllElements()
        setupConstraints()
    }
    
    private func addElements() {
        addSubview(titleLabel)
        
        addSubview(nameTextField)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(confirmPasswordTextField)
        
        addSubview(primaryButton)
    }
    
    private func disableAutoresizingMaskInAllElements() {
        subviews.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 36),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            nameTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 48),
            nameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            nameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            
            emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 24),
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 24),
            passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            
            confirmPasswordTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 24),
            confirmPasswordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            confirmPasswordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            
            primaryButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 130),
            primaryButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            primaryButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
        ])
    }
}
