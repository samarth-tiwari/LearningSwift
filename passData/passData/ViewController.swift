//
//  ViewController.swift
//  passData
//
//  Created by Samarth Tiwari on 11/08/22.
//

import UIKit

class ViewController: UIViewController {
    var button1: UIButton!
    var label1: UILabel!
    
    var button2: UIButton!
    var label2: UILabel!
    
    var button3: UIButton!
    var label3: UILabel!

    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .black
        button1 = UIButton(type: .system)
        button1.translatesAutoresizingMaskIntoConstraints = false
        button1.backgroundColor = .black
        button1.setTitle("Go to VC1", for: .normal)
        button1.setTitleColor(.yellow, for: .normal)
        button1.addTarget(self, action: #selector(openVC1), for: .touchUpInside)
        view.addSubview(button1)
        
        label1 = UILabel()
        label1.translatesAutoresizingMaskIntoConstraints = false
        label1.text = "VC1 Text"
        label1.backgroundColor = .black
        label1.textColor = .white
        view.addSubview(label1)

        button2 = UIButton(type: .system)
        button2.translatesAutoresizingMaskIntoConstraints = false
        button2.backgroundColor = .black
        button2.setTitle("Go to VC2", for: .normal)
        button2.setTitleColor(.yellow, for: .normal)
        button2.addTarget(self, action: #selector(openVC2), for: .touchUpInside)
        view.addSubview(button2)
        
        label2 = UILabel()
        label2.translatesAutoresizingMaskIntoConstraints = false
        label2.text = "VC2 Text"
        label2.backgroundColor = .black
        label2.textColor = .white
        view.addSubview(label2)
        
        button3 = UIButton(type: .system)
        button3.translatesAutoresizingMaskIntoConstraints = false
        button3.backgroundColor = .black
        button3.setTitle("Go to VC3", for: .normal)
        button3.setTitleColor(.yellow, for: .normal)
        button3.addTarget(self, action: #selector(openVC3), for: .touchUpInside)
        view.addSubview(button3)
        
        label3 = UILabel()
        label3.translatesAutoresizingMaskIntoConstraints = false
        label3.text = "VC3 Text"
        label3.backgroundColor = .black
        label3.textColor = .white
        view.addSubview(label3)
        
        label1.heightAnchor.constraint(equalToConstant: 44).isActive = true
        label1.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label1.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor).isActive = true

        button1.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button1.topAnchor.constraint(equalTo: label1.bottomAnchor).isActive = true
        button1.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        label2.heightAnchor.constraint(equalToConstant: 44).isActive = true
        label2.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label2.topAnchor.constraint(equalTo: button1.bottomAnchor).isActive = true

        button2.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button2.topAnchor.constraint(equalTo: label2.bottomAnchor).isActive = true
        button2.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        label3.heightAnchor.constraint(equalToConstant: 44).isActive = true
        label3.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label3.topAnchor.constraint(equalTo: button2.bottomAnchor).isActive = true

        button3.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button3.topAnchor.constraint(equalTo: label3.bottomAnchor).isActive = true
        button3.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Main View Controller"
        
        NotificationCenter.default.addObserver(self, selector: #selector(didGetNotification(_:)), name: Notification.Name(rawValue: "text"), object: nil)
    }
    @objc func didGetNotification(_ notification: Notification){
        let text = notification.object as! String?
        label2.text = text
        
    }
    
    
    
    
    @objc func openVC1(){
        let vc = storyboard?.instantiateViewController(withIdentifier: "vc1") as! ViewController1
        
        
        vc.dataPasser = { text in
            print(text!)
            self.label1.text = text
        }
        navigationController?.pushViewController(vc, animated: true)
    }

    @objc func openVC2(){
        let vc = storyboard?.instantiateViewController(withIdentifier: "vc2") as! ViewController2
        navigationController?.pushViewController(vc, animated: true)
    }

    @objc func openVC3(){
        let vc = storyboard?.instantiateViewController(withIdentifier: "vc3") as! ViewController3
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
    
}


extension ViewController: ViewController3Delegate {

    func passToVC(_ text: String?) {
        print("Inside Delegate")
        label3.text = text
    }
}

