//
//  CollectionViewCell.swift
//  Simple-CollectionView
//
//  Created by Maksym Kolodiy on 17/09/2019.
//  Copyright © 2019 Maksym Kolodiy. All rights reserved.
//

import Foundation
import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet var bookImage: UIImageView!
    @IBOutlet var bookLabel: UILabel!
    
    func displayContent(image: UIImage, title: String){
        bookImage.image = image
        bookLabel.text = title;
    }
}
