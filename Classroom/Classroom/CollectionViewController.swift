//
//  CollectionViewController.swift
//  Classroom
//
//  Created by Samarth Tiwari on 19/08/22.
//

import UIKit
class CollectionViewController: UICollectionViewController {
    private let itemsPerRow: CGFloat = 2
    private var cellHeight: CGFloat!
    private var cellWidth: CGFloat!
    private var sectionInsets = UIEdgeInsets(
      top: 50.0,
      left: 20.0,
      bottom: 50.0,
      right: 20.0)

    var delegate: CollectionViewDelegate?
    
    private let colorSet = [[UIColor.red, UIColor.blue, UIColor.cyan, UIColor.darkGray], [UIColor.yellow,UIColor.green,UIColor.orange,UIColor.systemYellow]]

    func calculateCellSize() {
        cellWidth = 0.8*view.frame.width/itemsPerRow
        cellHeight = cellWidth
//        print("Calculated cell Size",cellWidth,cellHeight)
        sectionInsets.left = (view.frame.width - itemsPerRow*cellWidth)/(itemsPerRow+1)
        sectionInsets.right = sectionInsets.left
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculateCellSize()
        title = "Collection View Controller"
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20;
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? Cell else { fatalError("Unable to dequeue") }
        cell.delegate = self
        cell.setIndex(to: indexPath.item)
        cell.setColors(to: colorSet[indexPath.row%2])
        return cell
    }
}

extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      return CGSize(width: cellWidth , height: cellHeight)
    }
  
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
    }
}

extension CollectionViewController: CellDelegate {
    func passToCollection(index: Int, color: UIColor) {
        delegate?.changeText(to: index, with: color)
        navigationController?.popViewController(animated: true)
    }
}

protocol CollectionViewDelegate {
    func changeText(to text: Int, with color: UIColor)
}
