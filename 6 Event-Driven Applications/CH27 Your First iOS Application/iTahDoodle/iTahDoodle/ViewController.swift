//
//  ViewController.swift
//  iTahDoodle
//
//  Created by Brigitte Michau on 2016/03/12.
//  Copyright © 2016 Brigitte Michau. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var itemTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    let todoList = ToDoList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        tableView.registerClass(UITableViewCell.self,
            forCellReuseIdentifier: "Cell")
        tableView.dataSource = todoList
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addButtonPressed(sender: UIButton) {
        guard let text = itemTextField.text else {
            return
        }
        todoList.addItem(text)
        tableView.reloadData()
    }

}

