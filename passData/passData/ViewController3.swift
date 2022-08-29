//
//  ViewController3.swift
//  passData
//
//  Created by Samarth Tiwari on 12/08/22.
//

import UIKit

class ViewController3: UIViewController {
    var field: UITextField!
    var button: UIButton!
    var delegate: ViewController3Delegate?
    
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .darkGray
        field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.backgroundColor = .white
        field.allowsEditingTextAttributes = true
        
        view.addSubview(field)
        
        button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Pass", for: .normal)
        button.addTarget(self, action: #selector(passData), for: .touchUpInside)
        view.addSubview(button)
        
        
        field.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor).isActive = true
        field.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor).isActive = true
        field.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        field.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        button.topAnchor.constraint(equalTo: field.bottomAnchor).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "View Controller 3"
    }
    
    @objc func passData() {
        
        delegate?.passToVC(field.text)
        navigationController?.popViewController(animated: true)
    }
}


protocol ViewController3Delegate {
    func passToVC(_ text: String?)
}
