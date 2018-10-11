//
//  Models.swift
//  digital-store
//
//  Created by ADELU ABIDEEN ADELEYE on 10/10/18.
//  Copyright © 2018 Spantom Technologies Ltd. All rights reserved.
//

import UIKit

@objcMembers
class AppCategory: NSObject {
    
    var name: String?
    
    var apps: [App]?
    
    var type: String?
    
    override func setValue(_ value: Any?, forKey key: String) {
        if key == "apps" {
            
            apps = [App]()
            for dict in value as! [[String: AnyObject]] {
                let app = App()
                app.setValuesForKeys(dict)
                apps?.append(app)
            }
            
        } else {
            super.setValue(value, forKey: key)
        }
    }
    
    
    static func fetchFeaturedApps(completionHandler: @escaping ([AppCategory]) -> ()) {
        
        let urlString = "https://api.letsbuildthatapp.com/appstore/featured"
        
        URLSession.shared.dataTask(with: URL(string: urlString)!) { (data, response, error) in
            
            if error != nil {
                print(error ?? "Error occured!")
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String: AnyObject]
                
                var appCategories = [AppCategory]()
                
                
                for dict in json["categories"] as! [[String: AnyObject]] {
                    
                    let appCategory = AppCategory()
                    appCategory.setValuesForKeys(dict)
                    appCategories.append(appCategory)
                }
                
                DispatchQueue.main.async( execute: { () -> Void in
                    completionHandler(appCategories)
                })
                
                
            } catch let err {
                print(err)
            }
            
            
        }.resume()
    }
    
    static func sampleAppCategories() -> [AppCategory] {
        
        let bestNewAppsCategory = AppCategory()
        bestNewAppsCategory.name = "Best New Apps"
        
        var apps = [App]()
        
        // logic
        let frozenApp = App()
        frozenApp.name = "Disney Build It: Frozen"
        frozenApp.imageName = "frozen"
        frozenApp.category = "Entertainment"
        frozenApp.price = NSNumber(floatLiteral: 3.99)
        apps.append(frozenApp)
        
        bestNewAppsCategory.apps = apps
        
        
        
        let bestNewGamesCategory = AppCategory()
        bestNewGamesCategory.name = "Best New Games"
        
        var bestNewGamesApps = [App]()
        
        let telepaintApp = App()
        telepaintApp.name = "Telepaint"
        telepaintApp.imageName = "telepaint"
        telepaintApp.category = "Games"
        telepaintApp.price = NSNumber(floatLiteral: 2.99)
        bestNewGamesApps.append(telepaintApp)
        bestNewGamesCategory.apps = bestNewGamesApps
        
        
        
        return [bestNewAppsCategory, bestNewGamesCategory]
        
        
    }
    
}

@objcMembers
class App: NSObject {
    
    var id: NSNumber?
    var name: String?
    var category: String?
    var imageName: String?
    var price: NSNumber?
    
}
