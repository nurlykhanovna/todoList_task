//
//  MyTodo.swift
//  myTodoLists
//
//
//  Created by Alima Seytkhan on 6/29/18.
//  Copyright © 2017 moon inc. All rights reserved.
import UIKit

class MyTodo: UITableViewController {
    
    var notes = [String]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        if let data = UserDefaults.standard.array(forKey: "data") as? [String] {
            notes = data
        } else {
            notes = [String]()
        }

    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let data = UserDefaults.standard.array(forKey: "data") as? [String] {
            notes = data
        } else {
            notes = [String]()
        }
        tableView.reloadData()
    }
    
    //edit Bar Button
    @IBAction func editAction(_ sender: UIBarButtonItem) {
        self.tableView.isEditing = !self.tableView.isEditing
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.notes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! NotesTableViewCell
        let task = notes[indexPath.row].components(separatedBy: "_")
        
        let textValueName = NotesClass(title: task[0], subTitle: task[1], imageName: task[2])
        
//        cell.myImageView.image = UIImage(named: task[2])
//        cell.myLabel.text = task[0]
//        cell.mySubLabel.text = task[1]
        cell.myLabel.text = textValueName.title!
        cell.mySubLabel.text = textValueName.subTitle!
        cell.myImageView.image = UIImage(named: textValueName.imageName!)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.notes.remove(at: indexPath.row)
            // перезапись данных в UserDefaults, так как remove будет удалять полностью все объекты
            UserDefaults.standard.set(self.notes, forKey: "data")
            self.tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let moved = self.notes.remove(at: sourceIndexPath.row)
        self.notes.insert(moved, at: destinationIndexPath.row)
    }
    
}

