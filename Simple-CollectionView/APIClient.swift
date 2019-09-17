//
//  APIClient.swift
//  Simple-CollectionView
//
//  Created by Maksym Kolodiy on 18/09/2019.
//  Copyright © 2019 Maksym Kolodiy. All rights reserved.
//

import Foundation

typealias AudiobookJSON = [String: Any]

struct APIClient {
    
    static func getAudiobooksAPI(completion: @escaping (AudiobookJSON?) -> Void) {
        
        let url = URL(string: "https://rss.itunes.apple.com/api/v1/pl/books/top-free/all/25/explicit.json")
        
        let session = URLSession.shared
        
        guard let unwrappedURL = url else { print("Error unwrapping URL"); return }
        
        let dataTask = session.dataTask(with: unwrappedURL) { (data, response, error) in
            
            guard let unwrappedDAta = data else { print("Error unwrapping data"); return }
            
            do {
                let responseJSON = try JSONSerialization.jsonObject(with: unwrappedDAta, options: []) as? AudiobookJSON
                completion(responseJSON)
            } catch {
                print("Could not get API data. \(error), \(error.localizedDescription)")
            }
        }
        dataTask.resume()
    }
}
