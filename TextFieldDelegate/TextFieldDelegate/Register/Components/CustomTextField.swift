//
//  CustomTextField.swift
//  TextFieldDelegate
//
//  Created by Gabriel Merenfeld on 25/02/26.
//

import UIKit

class CustomTextField: UITextField {
    
    var padding = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStyle()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupStyle()
    }
        
    private func setupStyle() {
        backgroundColor = .white
        layer.cornerRadius = 8
        layer.masksToBounds = true
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = 3
        borderStyle = .none
        heightAnchor.constraint(equalToConstant: 48).isActive = true
    }
    
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}
