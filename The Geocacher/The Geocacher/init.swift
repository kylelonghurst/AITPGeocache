//
//  init.swift
//  The Geocacher
//
//  Created by Kyle Longhurst on 4/8/16.
//  Copyright © 2016 Kyle Longhurst. All rights reserved.
//

import UIKit
import CoreData

class Initilization {
    
    class func initData() {
        
        let rosemont = [
            "title"         : "Rosemont Theatre",
            "difficulty"    : "Medium",
            "category"      : "Toys",
            "favorite"      : "true",
            "latitude"      : "41.9764092",
            "longitude"     : "-87.8644828",
            "clue"          : "Behind the dumpster in the back, look up and down to find it.",
            "size"          : "Small"
        ]
        
        let crowne = [
            "title"         : "Crowne Plaza Hotel",
            "difficulty"    : "Hard",
            "category"      : "Trinkets",
            "favorite"      : "false",
            "latitude"      : "41.977179",
            "longitude"     : "-87.8638266",
            "clue"          : "In the lobby, look under the water pitcher.",
            "size"          : "Extra Small"
        ]
        
        let blueLine = [
            "title"         : "Rosemont Blue Line",
            "difficulty"    : "Easy",
            "category"      : "Books",
            "favorite"      : "false",
            "latitude"      : "41.983969",
            "longitude"     : "-87.860316",
            "clue"          : "Behind one of the machines. Look low.",
            "size"          : "Medium"
        ]
        
        
        let steakHouse = [
            "title"         : "Gibson's Steakhouse",
            "difficulty"    : "Hard",
            "category"      : "Toys",
            "favorite"      : "false",
            "latitude"      : "41.978372",
            "longitude"     : "-87.862923",
            "clue"          : "Open the door slowly and you'll find it. Be sure to look both directions when you open the door.",
            "size"          : "Small"
        ]
        
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let context: NSManagedObjectContext = appDel.managedObjectContext
        
        let allLocations = [rosemont, crowne, blueLine, steakHouse]
        
        for inputDataItem in allLocations {
        
            let newGeolocation = NSEntityDescription.insertNewObjectForEntityForName("Geolocation", inManagedObjectContext: context)
            
            newGeolocation.setValue(inputDataItem["title"], forKey: "title")
            newGeolocation.setValue(inputDataItem["difficulty"], forKey: "difficulty")
            newGeolocation.setValue(inputDataItem["category"], forKey: "category")
            if let fav = inputDataItem["favorite"]?.toBool() {
                newGeolocation.setValue(fav, forKey: "favorite")
            }
            newGeolocation.setValue(Double(inputDataItem["latitude"]!)!, forKey: "latitude")
            newGeolocation.setValue(Double(inputDataItem["longitude"]!)!, forKey: "longitude")
            newGeolocation.setValue(inputDataItem["clue"], forKey: "clue")
            newGeolocation.setValue(inputDataItem["size"], forKey: "size")
            
            do {
                
                try context.save()
                
            } catch {
                
                print("There was a problem with \(inputDataItem["title"])")
                
            }
            
        }
        
        
        
        let request = NSFetchRequest(entityName: "Geolocation")
        
        request.predicate = NSPredicate(format: "favorite = %@", true)
        
        request.returnsObjectsAsFaults = false
        
        do {
            
            let results = try context.executeFetchRequest(request)
            
            if results.count > 0 {
                
                for result in results as! [NSManagedObject] {
                    
                    print(result.valueForKey("category")!)
                    print(result.valueForKey("favorite")!)
                    print(result.valueForKey("clue")!)
                    print(result.valueForKey("difficulty")!)
                    print(result.valueForKey("latitude")!)
                    print(result.valueForKey("longitude")!)
                    print(result.valueForKey("size")!)
                    print(result.valueForKey("title")!)
                    
                }
                
            }
            
        } catch {
            
            print("Fetch Failed")
        }
        
    }
}