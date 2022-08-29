//
//  TableViewController.swift
//  Classroom
//
//  Created by Samarth Tiwari on 19/08/22.
//

import UIKit

class TableViewController: UITableViewController {
    private var students: [Student]=[]
    private var classNumber: Int?
    
    private func registerTableViewCells() {
        let cell = UINib(nibName: "ProfileCell",bundle: nil)
        tableView.register(cell, forCellReuseIdentifier: "cell")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerTableViewCells()
        
        guard let classNumber = classNumber else { return }
        title = "Class \(classNumber)"
        students = studentList[classNumber-1]
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return students.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ProfileCell else {
            fatalError("Cannot create cell")
        }
        cell.fillStudentData(from: students[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let student = students[indexPath.row]
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "profile") as? ProfileViewController else { return }
        vc.setStudent(student: student)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func setClass(_class: Int) {
        classNumber = _class
    }
    
    func setStudents(data: [Student]) {
        students = data
    }
}
