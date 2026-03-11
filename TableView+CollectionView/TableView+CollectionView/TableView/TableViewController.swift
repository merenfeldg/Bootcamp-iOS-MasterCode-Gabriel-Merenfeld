//
//  ViewController.swift
//  TableView+CollectionView
//
//  Created by Gabriel Merenfeld on 11/03/26.
//

import UIKit

class TableViewController: UIViewController {
    private var screen: TableViewScreen?
    private var items: [ItemModel] = [
        ItemModel(title: "Carros"),
        ItemModel(title: "Avião"),
        ItemModel(title: "Barco"),
        ItemModel(title: "Moto"),
    ]
    
    override func loadView() {
        screen = TableViewScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
    }
    
    private func setupViewController() {
        screen?.setCollectionViewProtocols(datasource: self, delegate: self)
    }
}

extension TableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: ItemTableViewCell.identifier, for: indexPath) as? ItemTableViewCell
        else {
            return ItemTableViewCell()
        }
        
        cell.setupCell(item: items[indexPath.row])
        
        return cell
    }
}

extension TableViewController: UITableViewDelegate { }

