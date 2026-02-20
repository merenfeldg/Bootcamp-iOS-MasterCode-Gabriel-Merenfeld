//
//  CustomSecundaryButton.swift
//  Navegação ViewCode
//
//  Created by Gabriel Merenfeld on 20/02/26.
//

import UIKit

class CustomSecundaryButton: UIButton {
    
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
        setTitleColor(.black, for: .normal)
        backgroundColor = .lightText
        layer.cornerRadius = 8
        heightAnchor.constraint(equalToConstant: 48).isActive = true
    }
}
