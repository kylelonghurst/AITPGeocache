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
    
//    inputData: [[String:String]]
    
//    let rosemont = [
//        "title"         : "Rosemont Theatre",
//        "difficulty"    : "Medium",
//        "category"      : "Toys",
//        "latitude"      : "41.9764092",
//        "longitude"     : "-87.8644828",
//        "clue"          : "Behind the dumpster in the back, look up and down to find it.",
//        "size"          : "Small"
//    ]
//    
//    let crowne = [
//        "title"         : "Crowne Plaza Hotel",
//        "difficulty"    : "Hard",
//        "category"      : "Trinkets",
//        "latitude"      : "41.977179",
//        "longitude"     : "-87.8638266",
//        "clue"          : "In the lobby, look under the water pitcher.",
//        "size"          : "Extra Small"
//    ]
//    
//    let blueLine = [
//        "title"         : "Rosemont Blue Line",
//        "difficulty"    : "Easy",
//        "category"      : "Books",
//        "latitude"      : "41.983969",
//        "longitude"     : "-87.860316",
//        "clue"          : "Behind one of the machines. Look low.",
//        "size"          : "Medium"
//    ]
//    
//    
//    let steakHouse = [
//        "title"         : "Gibson's Steakhouse",
//        "difficulty"    : "Hard",
//        "category"      : "Toys",
//        "latitude"      : "41.978372",
//        "longitude"     : "-87.862923",
//        "clue"          : "Open the door slowly and you'll find it. Be sure to look both directions when you open the door.",
//        "size"          : "Small"
//    ]
    
//    let allLocations = [self.rosemont, self.crowne, self.blueLine, self.steakHouse]
    
//    newGeoLocation.setValue(inputDataItem["title"], forKey: "title")
//    newGeoLocation.setValue(inputDataItem["difficulty"], forKey: "difficulty")
//    newGeoLocation.setValue(inputDataItem["category"], forKey: "category")
//    newGeoLocation.setValue(inputDataItem["latitude"], forKey: "latitude")
//    newGeoLocation.setValue(inputDataItem["longitude"], forKey: "longitude")
//    newGeoLocation.setValue(inputDataItem["clue"], forKey: "clue")
//    newGeoLocation.setValue(inputDataItem["size"], forKey: "size")

    
    class func initData() {
        
        let rosemont = [
            "title"         : "Rosemont Theatre",
            "difficulty"    : "Medium",
            "category"      : "Toys",
            "latitude"      : "41.9764092",
            "longitude"     : "-87.8644828",
            "clue"          : "Behind the dumpster in the back, look up and down to find it.",
            "size"          : "Small",
            "favorite"      : "true"
        ]
        
        let crowne = [
            "title"         : "Crowne Plaza Hotel",
            "difficulty"    : "Hard",
            "category"      : "Trinkets",
            "latitude"      : "41.977179",
            "longitude"     : "-87.8638266",
            "clue"          : "In the lobby, look under the water pitcher.",
            "size"          : "Extra Small",
            "favorite"      : "false"
        ]
        
        let blueLine = [
            "title"         : "Rosemont Blue Line",
            "difficulty"    : "Easy",
            "category"      : "Books",
            "latitude"      : "41.983969",
            "longitude"     : "-87.860316",
            "clue"          : "Behind one of the machines. Look low.",
            "size"          : "Medium",
            "favorite"      : "false"
        ]
        
        
        let steakHouse = [
            "title"         : "Gibson's Steakhouse",
            "difficulty"    : "Hard",
            "category"      : "Toys",
            "latitude"      : "41.978372",
            "longitude"     : "-87.862923",
            "clue"          : "Open the door slowly and you'll find it. Be sure to look both directions when you open the door.",
            "size"          : "Small",
            "favorite"      : "false"
        ]
        
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let context: NSManagedObjectContext = appDel.managedObjectContext
        
        let allLocations = [rosemont, crowne, blueLine, steakHouse]
        
        for inputDataItem in allLocations {
        
            let newGeolocation = NSEntityDescription.insertNewObjectForEntityForName("Geolocation", inManagedObjectContext: context)
            
            newGeolocation.setValue(inputDataItem["title"], forKey: "title")
            newGeolocation.setValue(inputDataItem["difficulty"], forKey: "difficulty")
            newGeolocation.setValue(inputDataItem["category"], forKey: "category")
            newGeolocation.setValue(Double(inputDataItem["latitude"]!)!, forKey: "latitude")
            newGeolocation.setValue(Double(inputDataItem["longitude"]!)!, forKey: "longitude")
            newGeolocation.setValue(inputDataItem["clue"], forKey: "clue")
            newGeolocation.setValue(inputDataItem["size"], forKey: "size")
            newGeolocation.setValue(inputDataItem["favorite"]?.toBool(), forKey: "favorite")
            
            do {
                
                try context.save()
                
            } catch {
                
                print("There was a problem with \(inputDataItem["title"])")
                
            }
            
        }
    }
}