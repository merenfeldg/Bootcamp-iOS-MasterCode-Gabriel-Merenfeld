//
//  RegisterViewController.swift
//  Navegação ViewCode
//
//  Created by Gabriel Merenfeld on 20/02/26.
//

import UIKit

class RegisterViewController: UIViewController {
    
    private let contentView: RegisterScreen
    
    init(contentView: RegisterScreen) {
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
        navigationItem.hidesBackButton = true
    }
}
