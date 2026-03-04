//
//  UserTableViewCell.swift
//  ExercitandoTableView
//
//  Created by Gabriel Merenfeld on 04/03/26.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    lazy var iconImage: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
       
        label.font = .boldSystemFont(ofSize: 24)
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - CONFIGURATION CELL
extension UserTableViewCell {
    
    private func setupView() {
        addElements()
        disableTranslatesAutoresizingMaskInAllElements()
        configConstraints()
    }
    
    private func addElements() {
        addSubview(iconImage)
        addSubview(nameLabel)
    }
    
    private func disableTranslatesAutoresizingMaskInAllElements() {
        subviews.forEach { element in
            element.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            iconImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            iconImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            iconImage.heightAnchor.constraint(equalToConstant: 60),
            iconImage.widthAnchor.constraint(equalToConstant: 60),
            
            nameLabel.leadingAnchor.constraint(equalTo: iconImage.trailingAnchor, constant: 8),
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}
