//
//  Models.swift
//  digital-store
//
//  Created by ADELU ABIDEEN ADELEYE on 10/10/18.
//  Copyright © 2018 Spantom Technologies Ltd. All rights reserved.
//

import UIKit

struct FeaturedApps: Decodable {
    
    var bannerCategory: AppCategory?
    var categories: [AppCategory]?
    
}

struct AppCategory: Decodable {
    
    var name: String?
    var apps: [App]?
    var type: String?
    
    
    static func fetchFeaturedApps(completionHandler: @escaping (FeaturedApps) -> ()) {
        
        let urlString = "https://api.letsbuildthatapp.com/appstore/featured"
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else { return }
            
            if let error = error {
                print(error)
                return
            }
            
            do {

                
                let decoder = JSONDecoder()
                let featuredApps = try decoder.decode(FeaturedApps.self, from: data)
                
                DispatchQueue.main.async( execute: { () -> Void in
                    completionHandler(featuredApps)
                })
                
                
            } catch let err {
                print(err)
            }
            
            
        }.resume()
    }
    
}

struct App: Decodable {
    
    var Id: Int?
    var Name: String?
    var Category: String?
    var ImageName: String?
    var Price: Float?
    
    var Screenshots: [String]?
    var description: String?
    
    var appInformation: [AppInformation]?
    
}

struct AppInformation: Decodable {
    
    var Name: String?
    var Value: String?
}
