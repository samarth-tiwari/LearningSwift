//
//  ProfileViewController.swift
//  Classroom
//
//  Created by Samarth Tiwari on 23/08/22.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet private var profileImg: UIImageView!
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var ageLabel: UILabel!
    @IBOutlet private var classLabel: UILabel!
    private var student: Student!
    
    func presentStudent() {
        guard let imgURL = URL(string: student.getImageLocation()) else { return }
        guard let img = try? Data(contentsOf: imgURL) else { return }
        profileImg.image = UIImage(data: img)
        nameLabel.text = "Name: \(student.getName())"
        classLabel.text = "Class: \(student.getClass())"
        ageLabel.text = "Age: \(student.getAge())"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presentStudent()
    }
    

    func setStudent(student: Student) {
        self.student = student
    }

}
