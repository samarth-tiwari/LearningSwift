//
//  PersonCell.swift
//  project10_ names to faces
//
//  Created by Samarth Tiwari on 10/08/22.
//

import UIKit

class PersonCell: UICollectionViewCell {
    
    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var label: UILabel!
    
    func setText(_ text: String) {
        label.text = text
    }
    
    func setImage(_ path: URL){
        imageView.image = UIImage(contentsOfFile: path.path)
        imageView.layer.borderColor = UIColor(white: 0, alpha: 0.3).cgColor
        imageView.layer.borderWidth = 2
        imageView.layer.cornerRadius = 3
        layer.cornerRadius = 7
    }
}
