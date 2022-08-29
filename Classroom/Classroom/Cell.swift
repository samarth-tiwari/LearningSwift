//
//  cell.swift
//  Classroom
//
//  Created by Samarth Tiwari on 19/08/22.
//

import UIKit

class Cell: UICollectionViewCell {
    private var v1 = UIView()
    private var v2 = UIView()
    private var v3 = UIView()
    private var v4 = UIView()
    private var indexLabel: UILabel!
    var delegate: CellDelegate?
    private var index: Int! {
        didSet {
            guard let index = index else { fatalError("Index of cell not found") }
            indexLabel.text = "Index: \(index)"
        }
    }
    
    private func addGesturerecognisers() {
        [v1,v2,v3,v4].forEach { view in
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapped))
//            tapGesture.cancelsTouchesInView = false
            view.addGestureRecognizer(tapGesture)
        }
    }
    
    private func createIndexLabel() {
        indexLabel = UILabel()
        indexLabel.translatesAutoresizingMaskIntoConstraints = false
        indexLabel.text = "Label"
        self.addSubview(indexLabel)
        indexLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        indexLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
//        print("Cell size",self.contentView.frame.width, self.bounds.size)
    }
    
    private func createViews() {
        [v1,v2,v3,v4].forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(view)
        }
        NSLayoutConstraint.activate([
            v1.leftAnchor.constraint(equalTo: self.leftAnchor),
            v1.topAnchor.constraint(equalTo: self.topAnchor),
            v2.topAnchor.constraint(equalTo: self.topAnchor),
            v2.rightAnchor.constraint(equalTo: self.rightAnchor),
            v3.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            v3.leftAnchor.constraint(equalTo: self.leftAnchor),
            v4.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            v4.rightAnchor.constraint(equalTo: self.rightAnchor),
        ])
        
        [v1,v2,v3,v4].forEach({ view in
            view.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5).isActive = true
            view.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5).isActive = true
        })
    }
    
    override func awakeFromNib() {
        createViews()
        createIndexLabel()
        addGesturerecognisers()
        self.layer.cornerRadius = 10
    }
    
    @objc func tapped(_ sender: UITapGestureRecognizer){
        guard let color = sender.view?.backgroundColor else { return }
        delegate?.passToCollection(index: index, color: color)
    }
    
    func setColors(to colorSet: [UIColor]){
        let views = [v1, v2, v3, v4]
        for i in 0..<4 {
            views[i].backgroundColor = colorSet[i]
        }
    }
    
    func setIndex(to num: Int){
        index = num
    }
}

protocol CellDelegate {
    func passToCollection(index: Int, color: UIColor)
}
