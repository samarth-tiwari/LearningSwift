//
//  ViewController.swift
//  ByjusUI
//
//  Created by Samarth Tiwari on 29/08/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var logo: UIImageView!
    @IBOutlet var isd: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isd.clipsToBounds = true
        isd.layer.cornerRadius = 10
        logo.layer.borderWidth = 1
        logo.layer.borderColor = UIColor.systemBlue.cgColor
    }

}

