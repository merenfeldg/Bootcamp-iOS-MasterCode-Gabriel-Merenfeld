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
        screen?.backgroundColor = .red
    }
}

extension TableViewViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
}

