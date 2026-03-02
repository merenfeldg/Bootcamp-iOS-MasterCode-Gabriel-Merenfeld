//
//  TableViewScreen.swift
//  ExercitandoTableView
//
//  Created by Gabriel Merenfeld on 02/03/26.
//

import UIKit

class TableViewScreen: UIView {

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        
        tableView.backgroundColor = .white
        
        return tableView
    }()
    
    lazy var elements: [UIView] = [tableView]
    
    init() {
        super.init(frame: .zero)
        setupView()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - SCREEN CONFIGURATION
extension TableViewScreen {
    
    func setupView() {
        addElements()
        disableAutoresizingMaskInAllElements()
        configContraint()
    }
    
    func addElements() {
        elements.forEach { element in
            addSubview(element)
        }
    }
    
    func disableAutoresizingMaskInAllElements() {
        subviews.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    func configContraint() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
