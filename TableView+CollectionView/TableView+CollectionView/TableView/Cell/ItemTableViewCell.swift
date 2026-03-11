//
//  ItemTableViewCell.swift
//  TableView+CollectionView
//
//  Created by Gabriel Merenfeld on 11/03/26.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
    static let identifier = String(describing: ItemTableViewCell.self)
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 16)
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
        selectionStyle = .none
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(item: ItemModel) {
        titleLabel.text = item.title
    }
}

extension ItemTableViewCell {
    func setupCell() {
        addElements()
        configConstraints()
    }
    
    func addElements() {
        contentView.addSubview(titleLabel)
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
    }
}
