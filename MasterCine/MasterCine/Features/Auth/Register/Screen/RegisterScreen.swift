//
//  RegisterScreen.swift
//  MasterCine
//
//  Created by Gabriel Merenfeld on 21/03/26.
//

import UIKit

protocol RegisterScreenDelegateProtocol: AnyObject {
    func tappedCreateAccountPrimaryButton(register: RegisterModel)
    func tappedHaveAnAccountTerciaryButton()
}

class RegisterScreen: UIView {
    private var registerModel = RegisterModel()
    weak var delegate: RegisterScreenDelegateProtocol?
    
    //MARK: - COMPONENTS CONFIGURATION
    lazy var filmImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "film")
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Criar conta"
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
    
    lazy var confirmPasswordTextField: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = "Digite novamente sua senha..."
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        
        return textField
    }()
    
    lazy var createAccountPrimaryButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("Criar Conta", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 8.0
        
        return button
    }()
    
    lazy var haveAccountTerciaryButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("Já tenho uma conta", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.layer.cornerRadius = 8.0
        
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

//MARK: - CONFIGURATION VIEW
extension RegisterScreen {
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
        addSubview(confirmPasswordTextField)
        
        addSubview(createAccountPrimaryButton)
        addSubview(haveAccountTerciaryButton)
    }
    
    private func disableTranslatesAutoresizingMaskInAllElements() {
        subviews.forEach { element in
            element.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    func setTextFieldsDelegate(_ delegate: UITextFieldDelegate) {
        emailTextField.delegate = delegate
        passwordTextField.delegate = delegate
        confirmPasswordTextField.delegate = delegate
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
            
            confirmPasswordTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16),
            confirmPasswordTextField.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            confirmPasswordTextField.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            confirmPasswordTextField.heightAnchor.constraint(equalToConstant: 48),
            
            createAccountPrimaryButton.topAnchor.constraint(equalTo: confirmPasswordTextField.bottomAnchor, constant: 16),
            createAccountPrimaryButton.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            createAccountPrimaryButton.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            createAccountPrimaryButton.heightAnchor.constraint(equalToConstant: 48),
            
            haveAccountTerciaryButton.topAnchor.constraint(equalTo: createAccountPrimaryButton.bottomAnchor, constant: 8),
            haveAccountTerciaryButton.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            haveAccountTerciaryButton.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            haveAccountTerciaryButton.heightAnchor.constraint(equalToConstant: 48),
        ])
    }
}
// MARK: - ACTION CONFIGURATION
extension RegisterScreen {
    func configActions() {
        createAccountPrimaryButton.addTarget(self, action: #selector(tappedCreateAccountPrimaryButtonAction), for: .touchUpInside)
        
        haveAccountTerciaryButton.addTarget(self, action: #selector(tappedHaveAccountTerciaryButtonAction), for: .touchUpInside)
    }
    
    @objc private func tappedCreateAccountPrimaryButtonAction() {
        updateRegisterModelFromTextFields()
        delegate?.tappedCreateAccountPrimaryButton(register: registerModel)
    }
    
    @objc private func tappedHaveAccountTerciaryButtonAction() {
        
    }
    
    private func updateRegisterModelFromTextFields() {
        registerModel.email = emailTextField.text ?? ""
        registerModel.password = passwordTextField.text ?? ""
        registerModel.confirmPassword = confirmPasswordTextField.text ?? ""
    }
}
