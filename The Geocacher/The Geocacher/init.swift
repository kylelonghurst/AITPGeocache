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
    
    func initData() {
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let context: NSManagedObjectContext = appDel.managedObjectContext
        
        var newUser = NSEntityDescription.insertNewObjectForEntityForName("Users", inManagedObjectContext: context)
        
        newUser.setValue("Rob", forKey: "username")
        
        newUser.setValue("pass123", forKey: "password")
        
        do {
            
            try context.save()
            
        } catch {
            
            print("There was a problem!")
            
        }
        
        
        
        let request = NSFetchRequest(entityName: "Users")
        
        request.returnsObjectsAsFaults = false
        
        do {
            
            let results = try context.executeFetchRequest(request)
            
            if results.count > 0 {
                
                for result in results as! [NSManagedObject] {
                    
                    print(result.valueForKey("username")!)
                    print(result.valueForKey("password")!)
                    
                }
                
            }
            
        } catch {
            
            print("Fetch Failed")
        }
        
    }
}