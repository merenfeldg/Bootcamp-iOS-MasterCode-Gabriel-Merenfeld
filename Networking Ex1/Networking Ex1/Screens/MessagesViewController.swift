//
//  MessagesViewController.swift
//  Networking Ex1
//
//  Created by Gabriel Merenfeld on 13/04/26.
//

import UIKit

class MessagesViewController: UIViewController {
    var screen: MessagesScreen?
    
    let messages: [MessageModel] = [
        MessageModel(name: "Gabriel", message: "Oi tudo bem?"),
        MessageModel(name: "Gabriel", message: "Oi tudo bem?"),
        MessageModel(name: "Gabriel", message: "Oi tudo bem?"),
        MessageModel(name: "Gabriel", message: "Oi tudo bem?"),
        MessageModel(name: "Gabriel", message: "Oi tudo bem?")
    ]
    
    override func loadView() {
        screen = MessagesScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.setTableViewProtocols(dataSource: self, delegate: self)
    }
}

extension MessagesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MessageCell.identifier, for: indexPath) as? MessageCell else {
            return UITableViewCell()
        }
        
        let index = indexPath.row
        cell.setupCell(nameUser: messages[index].name, lastMessage: messages[index].message)
        
        return cell
    }
}

extension MessagesViewController: UITableViewDelegate {}
