//
//  ViewController.swift
//  ToDoApp
//
//  Created by Alper on 24.07.2018.
//  Copyright © 2018 Alper. All rights reserved.
//

import UIKit

class MainVC: UIViewController,UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var lists = ["Shopping","iOS Development", "Working on my project"]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        textField.delegate = self
        tableView.tableFooterView = UIView(frame: .zero)
    }

    
    @IBAction func addBtnPressed(_ sender: UIButton) {
        insertNewTitle()
    }
    
    func insertNewTitle() {
        if textField.text?.isEmpty != true {
            lists.append(textField.text!)
            let indexPath = IndexPath(row: lists.count - 1, section: 0)
            tableView.beginUpdates()
            tableView.insertRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
            textField.text = ""
            view.endEditing(true)
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lists.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = lists[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCellAccessoryType.checkmark{
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.checkmark
        }
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            lists.remove(at: indexPath.row)
//
//            tableView.beginUpdates()
//            tableView.deleteRows(at: [indexPath], with: .left)
//            tableView.endUpdates()
//        }
//
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "delete") { (action, view, nil) in
            self.lists.remove(at: indexPath.row)
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .left)
            tableView.endUpdates()
        }
        delete.image = #imageLiteral(resourceName: "delete")
       
           return UISwipeActionsConfiguration(actions: [delete])
    
    }
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let share = UIContextualAction(style: .normal, title: "share") { (action, view, nil) in
            
        }
        let edit = UIContextualAction(style: .normal, title: "edit") { (action, view, nil) in
            
        }
        share.image = #imageLiteral(resourceName: "share")
        share.backgroundColor = #colorLiteral(red: 0, green: 0.7217318548, blue: 0.1555175781, alpha: 1)
        edit.image = #imageLiteral(resourceName: "edit")
        edit.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        let configuration = UISwipeActionsConfiguration(actions: [share,edit])
        configuration.performsFirstActionWithFullSwipe = false
        return configuration
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 95
    }
        
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

        
    }



