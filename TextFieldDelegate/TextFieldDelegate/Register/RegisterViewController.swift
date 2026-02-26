//
//  ViewController.swift
//  TextFieldDelegate
//
//  Created by Gabriel Merenfeld on 25/02/26.
//

import UIKit

class RegisterViewController: UIViewController {

    private var contentView: RegisterScreen?
    
    override func loadView() {
        contentView = RegisterScreen()
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        contentView?.delegate(self)
    }
}

extension RegisterViewController: RegisterScreenDelegate {
    func tappedPrimaryButton() {
        
    }
}
