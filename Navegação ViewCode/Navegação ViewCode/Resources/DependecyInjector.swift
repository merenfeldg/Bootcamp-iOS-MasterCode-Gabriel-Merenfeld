//
//  DependecyInjector.swift
//  Navegação ViewCode
//
//  Created by Gabriel Merenfeld on 20/02/26.
//

import UIKit

class DependecyInjector {
    static let madeLoginViewControllerDependecy = LoginViewController(contentView: LoginScreen())
    
    static let madeRegisterViewControllerDependecy = RegisterViewController(contentView: RegisterScreen())
}
