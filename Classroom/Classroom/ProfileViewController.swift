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
    @IBOutlet private var passOrFailLabel: UILabel!
    private var classNumber: Int?
    private var showMoreButton: UIButton!
    private var student: Student!
    private var percentile: Double!
    private var detailView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presentStudent()
        if let classNumber = classNumber, classNumber > 3 {
            addButton()
            createDetailView()
        }
    }
    
    private func addButton() {
        showMoreButton = UIButton(type: .system)
        showMoreButton.translatesAutoresizingMaskIntoConstraints = false
        showMoreButton.setTitle("Show More", for: .normal)
        showMoreButton.addTarget(self, action: #selector(showDetails), for: .touchUpInside)
        view.addSubview(showMoreButton)
        
        NSLayoutConstraint.activate([
            showMoreButton.topAnchor.constraint(equalTo: passOrFailLabel.bottomAnchor, constant: 20),
            showMoreButton.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor)
        ])
    }
    
    private func presentStudent() {
        guard let imgURL = URL(string: student.getImageLocation()) else { return }
        guard let img = try? Data(contentsOf: imgURL) else { return }
        profileImg.image = UIImage(data: img)
        nameLabel.text = "Name: \(student.getName())"
        classLabel.text = "Class: \(student.getClass())"
        ageLabel.text = "Age: \(student.getAge())"
        
        if student.getMarks() > 63 {
            passOrFailLabel.text = "Pass"
            passOrFailLabel.textColor = .systemGreen
        } else {
            passOrFailLabel.text = "Fail"
            passOrFailLabel.textColor = .systemRed
        }
    }
    
    private func createDetailView() {
        detailView = UIView()
        detailView.translatesAutoresizingMaskIntoConstraints = false
        detailView.backgroundColor = .systemPurple
        detailView.isHidden = true
        view.addSubview(detailView)
        
        let marksLabel = UILabel()
        marksLabel.translatesAutoresizingMaskIntoConstraints = false
        marksLabel.textColor = .white
        marksLabel.text = "Marks: \(student.getMarks())"
        detailView.addSubview(marksLabel)
        
        let percentileLabel = UILabel()
        percentileLabel.translatesAutoresizingMaskIntoConstraints = false
        percentileLabel.textColor = .white
        percentileLabel.text = "Percentile: \(percentile ?? -1)"
        detailView.addSubview(percentileLabel)
        
        NSLayoutConstraint.activate([
            detailView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            detailView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            detailView.topAnchor.constraint(equalTo: showMoreButton.bottomAnchor, constant:  20),
            detailView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            marksLabel.leadingAnchor.constraint(equalTo: detailView.layoutMarginsGuide.leadingAnchor),
            marksLabel.topAnchor.constraint(equalTo: detailView.layoutMarginsGuide.topAnchor),
            percentileLabel.trailingAnchor.constraint(equalTo: detailView.layoutMarginsGuide.trailingAnchor),
            percentileLabel.topAnchor.constraint(equalTo: detailView.layoutMarginsGuide.topAnchor),
        ])
    }
 
    @objc func showDetails(_ sender: UIButton) {
        if detailView.isHidden {
            sender.setTitle("Show Less", for: .normal)
        } else {
            sender.setTitle("Show More", for: .normal)
        }
        detailView.isHidden = !detailView.isHidden
    }
    
    func setStudent(student: Student) {
        self.student = student
    }
    
    func setClass(to _class: Int?) {
        classNumber = _class
    }
    
    func setPercentile(to percentile: Double) {
        self.percentile = Double(round(percentile*100)/100)
    }
}
