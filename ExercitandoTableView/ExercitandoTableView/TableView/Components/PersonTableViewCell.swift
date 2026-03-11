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
        label.numberOfLines = 0
        
        return label
    }()
    
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 14)
        label.textColor = .lightGray
        label.numberOfLines = 0
        
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
    
    private func setupView() {
        addElements()
        disableTranslatesAutoresizingMaskInAllElements()
        configConstraints()
    }
    
    private func addElements() {
        contentView.addSubview(iconImage)
        contentView.addSubview(nameLabel)
        contentView.addSubview(emailLabel)
    }
    
    private func disableTranslatesAutoresizingMaskInAllElements() {
        subviews.forEach { element in
            element.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            iconImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            iconImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 100),
            iconImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -100),
            iconImage.heightAnchor.constraint(equalToConstant: 60),
            iconImage.widthAnchor.constraint(equalToConstant: 60),
            
            nameLabel.leadingAnchor.constraint(equalTo: iconImage.trailingAnchor, constant: 8),
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}
