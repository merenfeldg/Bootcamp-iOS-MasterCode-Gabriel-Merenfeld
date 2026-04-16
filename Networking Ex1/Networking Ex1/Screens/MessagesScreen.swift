//
//  MessagesScreen.swift
//  Networking Ex1
//
//  Created by Gabriel Merenfeld on 13/04/26.
//

import UIKit

class MessagesScreen: UIView {
    // MARK: - COMPONENTS
    lazy var scrollVertical: UITableView = {
        let tableView = UITableView()
        
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.register(MessageCell.self, forCellReuseIdentifier: MessageCell.identifier)
        
        return tableView
    }()
    
    // MARK: - INITs
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - CONFIG SCREEN
extension MessagesScreen {
    func setTableViewProtocols(dataSource: UITableViewDataSource, delegate: UITableViewDelegate) {
        scrollVertical.dataSource = dataSource
        scrollVertical.delegate = delegate
    }
    
    private func setupView() {
        backgroundColor = .white
        addElements()
        disableAutoresizingMaskIntoConstraints()
        configConstraints()
    }
    
    private func addElements() {
        addSubview(scrollVertical)
    }
    
    private func disableAutoresizingMaskIntoConstraints() {
        subviews.forEach { element in
            element.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            scrollVertical.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollVertical.bottomAnchor.constraint(equalTo: bottomAnchor),
            scrollVertical.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollVertical.trailingAnchor.constraint(equalTo: leadingAnchor),
        ])
    }
}
