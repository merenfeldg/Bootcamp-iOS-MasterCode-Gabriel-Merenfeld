//
//  LoginScreen.swift
//  MasterCine
//
//  Created by Gabriel Merenfeld on 12/03/26.
//

import UIKit

protocol LoginScreenDelegateProtocol: AnyObject {
    func tappedLoginPrimaryButton(login: LoginModel)
    func tappedHaventAccountTerciaryButton()
}

class LoginScreen: UIView {
    private var loginModel = LoginModel()
    weak var delegate: LoginScreenDelegateProtocol?
    
//MARK: - COMPONENTS CONFIGURATION
    lazy var filmImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "film")
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "MasterCine"
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 24)
        
        return label
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = "Digite seu email..."
        textField.borderStyle = .roundedRect
        
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = "Digite sua senha..."
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        
        return textField
    }()
    
    lazy var enterPrimaryButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("Entrar", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 8.0
        
        return button
    }()
    
    lazy var haventAccountTerciaryButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("Não tem uma conta? Criar conta", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        
        return button
    }()
    
// MARK: - INITS
    init() {
        super.init(frame: .zero)
        setupView()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - ACTIONS CONFIGURATION
extension LoginScreen {
    private func configActions() {
        enterPrimaryButton.addTarget(self, action: #selector(tappedLoginPrimaryButtonAction), for: .touchUpInside)
        
        haventAccountTerciaryButton.addTarget(self, action: #selector(tappedHaventAccountTerciaryButtonAction), for: .touchUpInside)
    }
    
    @objc func tappedLoginPrimaryButtonAction() {
        loginModel.email = emailTextField.text ?? ""
        loginModel.password = passwordTextField.text ?? ""
        
        delegate?.tappedLoginPrimaryButton(login: loginModel)
    }
    
    @objc func tappedHaventAccountTerciaryButtonAction() {
        delegate?.tappedHaventAccountTerciaryButton()
    }
}

// MARK: - CONFIGURATION VIEW
extension LoginScreen {    
    private func setupView() {
        backgroundColor = .white
        addElements()
        disableTranslatesAutoresizingMaskInAllElements()
        configConstraints()
        configActions()
    }
    
    private func addElements() {
        addSubview(filmImage)
        addSubview(titleLabel)
        
        addSubview(emailTextField)
        addSubview(passwordTextField)
        
        addSubview(enterPrimaryButton)
        addSubview(haventAccountTerciaryButton)
    }
    
    private func disableTranslatesAutoresizingMaskInAllElements() {
        subviews.forEach { element in
            element.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    func setTextFieldsDelegate(_ delegate: UITextFieldDelegate) {
        emailTextField.delegate = delegate
        passwordTextField.delegate = delegate
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            filmImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 56),
            filmImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            filmImage.heightAnchor.constraint(equalToConstant: 60),
            filmImage.widthAnchor.constraint(equalToConstant: 70),
            
            titleLabel.topAnchor.constraint(equalTo: filmImage.bottomAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            
            emailTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 24),
            emailTextField.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            emailTextField.heightAnchor.constraint(equalToConstant: 48),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 16),
            passwordTextField.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 48),
            
            enterPrimaryButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16),
            enterPrimaryButton.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            enterPrimaryButton.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            enterPrimaryButton.heightAnchor.constraint(equalToConstant: 48),
            
            haventAccountTerciaryButton.topAnchor.constraint(equalTo: enterPrimaryButton.bottomAnchor, constant: 8),
            haventAccountTerciaryButton.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            haventAccountTerciaryButton.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            haventAccountTerciaryButton.heightAnchor.constraint(equalToConstant: 48),
        ])
    }
}
