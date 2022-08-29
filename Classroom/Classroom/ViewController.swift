//
//  ViewController.swift
//  Classroom
//
//  Created by Samarth Tiwari on 19/08/22.
//

import UIKit

class ViewController: UIViewController {
    private var label: UILabel!
    
    func loadButtons() {
        label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hello World"
        label.font = UIFont(name: label.font.fontName, size: 20)
        label.textAlignment = .center
        view.addSubview(label)
        
        let collectionViewButton = UIButton(type: .system)
        collectionViewButton.translatesAutoresizingMaskIntoConstraints = false
        collectionViewButton.setTitle("Collection View", for: .normal)
        collectionViewButton.addTarget(self, action: #selector(openCollectionView), for: .touchUpInside)
        view.addSubview(collectionViewButton)
        
        let buttonsView = UIView()
        buttonsView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonsView)
        
        let width = Int(view.frame.width)/2
        let height = 80
        for row in 0..<3 {
            for column in 0..<2 {
                let classNum = 2*row + column + 1
                let classButton = UIButton(type: .system)
                classButton.titleLabel?.font = UIFont.systemFont(ofSize: 24)
                classButton.setTitle("Class \(classNum)", for: .normal)
                classButton.addTarget(self, action: #selector(classTapped), for: .touchUpInside)
                
                let frame = CGRect(x: column * width, y: row * height, width: width, height: height)
                classButton.frame = frame
                buttonsView.addSubview(classButton)
            }
        }
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            collectionViewButton.topAnchor.constraint(equalTo: label.bottomAnchor),
            collectionViewButton.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
            collectionViewButton.heightAnchor.constraint(equalToConstant: 50),
            buttonsView.widthAnchor.constraint(equalTo: view.widthAnchor),
            buttonsView.heightAnchor.constraint(equalToConstant: 240),
            buttonsView.topAnchor.constraint(equalTo: collectionViewButton.bottomAnchor, constant: 20)
        ])
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Home"
        loadButtons()
    }

    @objc func openCollectionView(){
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "collection") as? CollectionViewController else { return }
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func classTapped(_ sender: UIButton) {
        guard let buttonText = sender.titleLabel?.text else { return }
//        print("tapped \(buttonText)")
        let lastChar = buttonText.last
        guard let lastChar = lastChar else { return }
        guard let num = Int(String(lastChar)) else { return }
//        print(type(of: num))
        
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "table") as? TableViewController else { return }
        vc.setClass(_class: num)
        vc.setStudents(data: studentList[num-1])
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension ViewController: CollectionViewDelegate {
    func changeText(to index: Int, with color: UIColor) {
        label.text = "Index of selected cell: \(index)"
        label.textColor = color
        navigationController?.popViewController(animated: true)
    }
}
