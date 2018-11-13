//
//  MenuController.swift
//  Restaurant
//
//  Created by Student on 13/11/2018.
//  Copyright © 2018 Student. All rights reserved.
//

import Foundation

class MenuController {
    let baseURL = URL(string: "http://api.armenu.net:8090/")!
    
    func fetchCategories(completion: @escaping ([String]?) -> Void) {
        let categoryURL = baseURL.appendingPathComponent("categories")
        let task = URLSession.shared.dataTask(with: categoryURL){
            data, response, error in
            guard let data = data else { return }
            guard let jsonDictionary = try? JSONSerialization.jsonObject(with: data) as? [String:Any] else { return }
            guard let categories = jsonDictionary?["categories"] as? [String] else { return }
            
            completion(categories)
        }
        task.resume()
    }
}
