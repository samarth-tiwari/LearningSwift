//
//  ViewController.swift
//  TodoList
//
//  Created by Samarth Tiwari on 02/08/22.
//

import UIKit
import Foundation

class ViewController: UITableViewController {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var todoList = [Todo]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAdd))
        getTodos()
    }
    
    func getTodos() {
        do {
            todoList = try context.fetch(Todo.fetchRequest())
            tableView.reloadData()
        } catch {
            // error
        }
    }
    
    func saveTodos() {
        do {
            try context.save()
        } catch {
            // error
        }
    }

    @objc func didTapAdd() {
        let ac = UIAlertController(title: "Add Item", message: "Enter the item title", preferredStyle: .alert)
        ac.addTextField()
        ac.addAction(UIAlertAction(title: "Submit", style: .default, handler: { [weak self, weak ac] _ in
            guard let text = ac?.textFields?[0].text, !text.isEmpty else {return}
            self?.addTodo(text)
        }))
        ac.addAction(UIAlertAction(title: "Cancel", style: .default))
        ac.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(ac, animated: true)
        
    }
    
    func addTodo(_ body: String) {
        let item = Todo(context: context)
        item.create(task: body)
        
        todoList.append(item)
        saveTodos()
//        getTodos()
        tableView.reloadData()
    }
    
    
    // tableview functions
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = todoList[indexPath.row].body
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        
        cell.detailTextLabel?.text = formatDate(date: todoList[indexPath.row].createdAt)
        
        return cell
    }
    
    func formatDate(date: Date?) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        guard let _date = date else {return ""}
        let txt = dateFormatter.string(from: _date)
        return txt
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let ac = UIAlertController(title: "Done the task?", message: "Click Done to remove item from list", preferredStyle: .alert)
        
        ac.addTextField()
        ac.addAction(UIAlertAction(title: "Done", style: .default, handler: {[weak self] _ in
            self?.context.delete((self?.todoList[indexPath.row])!)
            self?.todoList.remove(at: indexPath.row)
            self?.saveTodos()
            self?.tableView.reloadData()
        }))
        
        ac.addAction(UIAlertAction(title: "Update", style: .default) {
            [weak self, weak ac] _ in
            guard let text = ac?.textFields?[0].text, !text.isEmpty else {return}
            self?.todoList[indexPath.row].update(task: text)
            self?.saveTodos()
            self?.tableView.reloadData()
            
        })
        ac.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(ac, animated: true)
    }
}

