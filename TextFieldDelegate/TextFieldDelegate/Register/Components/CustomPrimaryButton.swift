//
//  CustomPrimaryButton.swift
//  TextFieldDelegate
//
//  Created by Gabriel Merenfeld on 25/02/26.
//

import UIKit

class CustomPrimaryButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStyle()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupStyle()
    }
    
    private func setupStyle() {
        titleLabel?.font = .boldSystemFont(ofSize: 16)
        setTitleColor(.white, for: .normal)
        layer.cornerRadius = 8
        heightAnchor.constraint(equalToConstant: 48).isActive = true
    }
}

