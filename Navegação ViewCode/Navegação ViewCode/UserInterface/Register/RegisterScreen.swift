//
//  RegisterScreen.swift
//  Navegação ViewCode
//
//  Created by Gabriel Merenfeld on 20/02/26.
//

import UIKit

class RegisterScreen: UIView {
    
    private weak var delegate: RegisterScreenDelegateProtocol?
    
    private lazy var frajolaImage: UIImageView = {
        let image = UIImageView()
        
        image.image = UIImage(named: "Frajola Image")
        
        return image
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Fazer Cadastro"
        label.font = .boldSystemFont(ofSize: 24)
        label.textColor = .black
        
        return label
    }()
    
    private lazy var fullNameTextField: UITextField = {
        let textField = CustomTextField()
        
        textField.placeholder = "Digite seu nome completo..."
        
        return textField
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
        
        button.setTitle("Já tenho uma conta", for: .normal)
        
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func delegate(_ delegate: RegisterScreenDelegateProtocol) {
        self.delegate = delegate
    }
    
    @objc private func primaryButtonAction() {
        delegate?.tappedRegisterPrimaryButton()
    }
    
    @objc private func secundaryButtonAction() {
        delegate?.tappedIAlreadyHaveAnAccountSecundaryButton()
    }
}

extension RegisterScreen {
    
    private func setupView() {
        backgroundColor = .yellowFrajola
        addElements()
        disableAutoresizingMaskInAllElements()
        setupConstraints()
        configActions()
    }
    
    private func addElements() {
        addSubview(frajolaImage)
        addSubview(titleLabel)
        
        addSubview(fullNameTextField)
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
            frajolaImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 36),
            frajolaImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            frajolaImage.heightAnchor.constraint(equalToConstant: 120),
            frajolaImage.widthAnchor.constraint(equalToConstant: 80),
            
            titleLabel.topAnchor.constraint(equalTo: frajolaImage.bottomAnchor, constant: 16),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            fullNameTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 48),
            fullNameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            fullNameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            
            emailTextField.topAnchor.constraint(equalTo: fullNameTextField.bottomAnchor, constant: 24),
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 24),
            passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            
            primaryButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 130),
            primaryButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            primaryButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            
            secundaryButton.topAnchor.constraint(equalTo: primaryButton.bottomAnchor, constant: 16),
            secundaryButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            secundaryButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24)
        ])
    }
    
    private func configActions() {
        primaryButton.addTarget(self, action: #selector(primaryButtonAction), for: .touchUpInside)
        
        secundaryButton.addTarget(self, action: #selector(secundaryButtonAction), for: .touchUpInside)
    }
}
