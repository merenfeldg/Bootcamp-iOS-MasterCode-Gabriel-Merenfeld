//
//  ViewController.swift
//  ExercitandoTableView
//
//  Created by Gabriel Merenfeld on 02/03/26.
//

import UIKit

class TableViewViewController: UIViewController {

    var screen: TableViewScreen?
    
    override func loadView() {
        screen = TableViewScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    private func setupTableView() {
        screen?.tableView.dataSource = self
        screen?.tableView.delegate = self
    }
}

//MARK: - DATASOURCE
extension TableViewViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personsMock.count + usersMock.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let currentIndex = indexPath.row
        
        if verifyIndexIsUserCell(currentIndex) {
            let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.identifier) as? UserTableViewCell
            cell?.setupCell(user: usersMock[currentIndex])
            return cell ?? UITableViewCell()
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: PersonTableViewCell.identifier) as? PersonTableViewCell
            let indexBasedOnPersonsMock = currentIndex - usersMock.count
            
            cell?.setupCell(person: personsMock[indexBasedOnPersonsMock])
            return cell ?? UITableViewCell()
        }
    }
    
    private func verifyIndexIsUserCell(_ index: Int) -> Bool {
        return index < usersMock.count
    }
}

// MARK: - TABLEVIEWDELEGATE
extension TableViewViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
    
        let deleteAction = UIContextualAction(style: .destructive, title: "Remover") { action, view, completion in
            
            personsMock.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            completion(true)
        }
        
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        return configuration
    }
}
