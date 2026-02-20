//
//  LoginScreen.swift
//  Navegação ViewCode
//
//  Created by Gabriel Merenfeld on 20/02/26.
//

import UIKit

class LoginScreen: UIView {
    
    private lazy var patolinoImage: UIImageView = {
        let image = UIImageView()
        
        image.image = UIImage(named: "Patolino Image")
        
        return image
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Fazer Login"
        label.font = .boldSystemFont(ofSize: 24)
        label.textColor = .black
        
        return label
    }()
    
    private lazy var emailTextField: UITextField = {
        let textField = CustomTextField()
        
        textField.placeholder = "Digite seu email..."
        
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = CustomTextField()
        
        textField.placeholder = "Digite sua senha..."
        textField.isSecureTextEntry = true
        
        return textField
    }()
    
    private lazy var primaryButton: UIButton = {
        let button = CustomPrimaryButton()
        
        button.setTitle("Login", for: .normal)
        
        return button
    }()
    
    private lazy var secundaryButton: UIButton = {
        let button = CustomSecundaryButton()
        
        button.setTitle("Não tem um conta? Cadastre agora", for: .normal)
        
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Configuration Screen
extension LoginScreen {
    
    private func setupView() {
        backgroundColor = .greenPatolino
        addElements()
        disableAutoresizingMaskInAllElements()
        setupConstraints()
    }
    
    private func addElements() {
        addSubview(patolinoImage)
        addSubview(titleLabel)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(primaryButton)
        addSubview(secundaryButton)
    }
    
    private func disableAutoresizingMaskInAllElements() {
        subviews.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            patolinoImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 36),
            patolinoImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            patolinoImage.heightAnchor.constraint(equalToConstant: 120),
            patolinoImage.widthAnchor.constraint(equalToConstant: 80),
            
            titleLabel.topAnchor.constraint(equalTo: patolinoImage.bottomAnchor, constant: 16),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            emailTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 48),
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 24),
            passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            
            primaryButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 200),
            primaryButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            primaryButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            
            secundaryButton.topAnchor.constraint(equalTo: primaryButton.bottomAnchor, constant: 16),
            secundaryButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            secundaryButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24)
        ])
    }
}
