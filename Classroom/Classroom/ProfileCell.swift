//
//  ProfileCell.swift
//  Classroom
//
//  Created by Samarth Tiwari on 24/08/22.
//

import UIKit

class ProfileCell: UITableViewCell {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var ageLabel: UILabel!
    @IBOutlet var profilePic: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func fillStudentData(from student: Student) {
        nameLabel.text = student.getName()
        ageLabel.text = "\(student.getAge())"
        let imgURL = student.getImageLocation()
        DispatchQueue.global(qos: .userInitiated).async {
            guard let url = URL(string: imgURL) else { return }
            guard let data = try? Data(contentsOf: url) else { return }
            DispatchQueue.main.async { [weak self] in
                self?.profilePic.image = UIImage(data: data)
            }
        }
    }
}
