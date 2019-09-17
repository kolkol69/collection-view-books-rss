//
//  Audiobook.swift
//  Simple-CollectionView
//
//  Created by Maksym Kolodiy on 18/09/2019.
//  Copyright © 2019 Maksym Kolodiy. All rights reserved.
//

import Foundation

struct Audiobook {
    let name: String
    let author: String
    let coverImage: String
    
    init(dictionary: AudiobookJSON) {
        self.name = dictionary["name"] as! String
        self.author = dictionary["artistName"] as! String
        self.coverImage = dictionary["artworkUrl100"] as! String
    }
    
}
