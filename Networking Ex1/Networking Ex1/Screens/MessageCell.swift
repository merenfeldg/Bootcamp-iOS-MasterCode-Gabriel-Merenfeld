//
//  MessageCell.swift
//  Networking Ex1
//
//  Created by Gabriel Merenfeld on 13/04/26.
//

import UIKit

class MessageCell: UITableViewCell {
    
    static let identifier = String(describing: MessageCell.self)
    
    //MARK: - ELEMENTS
    lazy var photoUserImage: UIImageView = {
        let image = UIImageView()
        
        image.image = UIImage(systemName: "person")
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.layer.cornerRadius = 16
        
        return image
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        
        label.font = .boldSystemFont(ofSize: 16)
        
        return label
    }()
    
    lazy var messageLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 12)
        
        return label
    }()
    
    //MARK: - INITs
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: CONFIG VIEW
extension MessageCell {
    func setupCell(nameUser: String, lastMessage: String) {
        nameLabel.text = nameUser
        messageLabel.text = lastMessage
    }
    
    private func setupView() {
        addElementsInScreen()
        disableAutoresizngMaskIntoContraintsInAllElements()
        configConstraints()
    }
    
    private func addElementsInScreen() {
        contentView.addSubview(photoUserImage)
        contentView.addSubview(nameLabel)
        contentView.addSubview(messageLabel)
    }
    
    private func disableAutoresizngMaskIntoContraintsInAllElements() {
        subviews.forEach { element in
            element.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            photoUserImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            photoUserImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            photoUserImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            photoUserImage.heightAnchor.constraint(equalToConstant: 36),
            photoUserImage.widthAnchor.constraint(equalTo: photoUserImage.heightAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: photoUserImage.topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: photoUserImage.trailingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            messageLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            messageLabel.bottomAnchor.constraint(equalTo: photoUserImage.bottomAnchor),
            messageLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            messageLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
        ])
    }
}
