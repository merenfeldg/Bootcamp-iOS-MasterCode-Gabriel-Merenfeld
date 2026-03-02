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

