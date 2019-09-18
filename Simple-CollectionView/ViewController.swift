//
//  ViewController.swift
//  Simple-CollectionView
//
//  Created by Maksym Kolodiy on 17/09/2019.
//  Copyright © 2019 Maksym Kolodiy. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet var collectionView: UICollectionView!
    
    let store = DataStore.sharedInstance
    
    let reusableIdentifier = "collectionViewCell";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        store.getBookImages {
            self.collectionView.reloadSections(IndexSet(integer: 0))
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return store.audiobooks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reusableIdentifier, for: indexPath) as! CollectionViewCell
        
        let book = store.audiobooks[indexPath.row]
        
        cell.displayContent(image: store.images[indexPath.row], title: book.name)
        cell.contentView.backgroundColor = UIColor.clear
        cell.layer.borderColor = UIColor(red: 240/256, green: 240/256, blue: 240/256, alpha: 1).cgColor
        cell.layer.borderWidth = 1.5
        
        cell.layer.cornerRadius = 15.0
        cell.layer.masksToBounds = true
        
        
        cell.layer.shadowColor = UIColor(red: 150/256, green: 150/256, blue: 150/256, alpha: 0.8).cgColor
        cell.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
        cell.layer.shadowRadius = 3.0
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.layer.cornerRadius).cgPath
        cell.layer.backgroundColor = UIColor(red: 245/256, green: 245/256, blue: 245/256, alpha: 1).cgColor
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selected \(indexPath.item)");
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderColor = UIColor.blue.cgColor
        cell?.isSelected = true
    }
//
//    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
//        let cell = collectionView.cellForItem(at: indexPath)
//        cell?.layer.borderColor = UIColor.clear.cgColor
//        cell?.layer.borderWidth = 1
//        cell?.isSelected = false
//    }
    


}

