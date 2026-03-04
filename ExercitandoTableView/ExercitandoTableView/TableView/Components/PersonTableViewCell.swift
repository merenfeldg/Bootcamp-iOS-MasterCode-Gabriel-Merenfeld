//
//  UserTableViewCell.swift
//  ExercitandoTableView
//
//  Created by Gabriel Merenfeld on 02/03/26.
//

import UIKit

class PersonTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: PersonTableViewCell.self)
    
    lazy var iconImage: UIImageView = {
        let image = UIImageView()
        
        return image
    }()
    
    lazy var nameLabel: UILabel = {
       let label = UILabel()
        
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .black
        
        return label
    }()
    
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 14)
        label.textColor = .lightGray
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(person: PersonModel) {
        iconImage.image = UIImage(systemName: person.iconImage)
        nameLabel.text = person.name
        emailLabel.text = person.email
    }
}

// MARK: - CONFIGURATION VIEW
extension PersonTableViewCell {
    
    func setupView() {
        addElements()
        disableTranslatesAutoresizingMaskInAllElements()
        configConstraints()
    }
    
    func addElements() {
        addSubview(iconImage)
        addSubview(nameLabel)
        addSubview(emailLabel)
    }
    
    func disableTranslatesAutoresizingMaskInAllElements() {
        subviews.forEach { element in
            element.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            iconImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            iconImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            iconImage.heightAnchor.constraint(equalToConstant: 100),
            iconImage.widthAnchor.constraint(equalToConstant: 100),
            
            nameLabel.topAnchor.constraint(equalTo: iconImage.topAnchor, constant: 16),
            nameLabel.leadingAnchor.constraint(equalTo: iconImage.leadingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: -20),
            
            emailLabel.topAnchor.constraint(equalTo: nameLabel.topAnchor, constant: 8),
            emailLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor, constant: 20),
            emailLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: -20),
        ])
    }
}
