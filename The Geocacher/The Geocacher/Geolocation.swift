//
//  Geolocation.swift
//  The Geocacher
//
//  Created by Kyle Longhurst on 4/8/16.
//  Copyright © 2016 Kyle Longhurst. All rights reserved.
//

import Foundation
import MapKit


class Geolocation : NSObject, MKAnnotation {
    var title: String?
    var difficulty: String?
    var size: String?
    var clue: String?
    var category: String?
    var favorite: Bool
    var latitude: Double
    var longitude: Double
    var coordinate: CLLocationCoordinate2D

    init(title: String, difficulty: String?, size: String?, clue: String?, category: String?, favorite: Bool?, latitude: String, longitude: String) {
        self.title = title
        self.difficulty = difficulty
        self.size = size
        self.clue = clue
        self.favorite = favorite != nil ? favorite! : false
        self.category = category
        self.latitude = Double(latitude)!
        self.longitude = Double(longitude)!
        self.coordinate = CLLocationCoordinate2DMake(self.latitude, self.longitude)
        
        super.init()
    }
    
    func favoriteButton() {
        favorite = !favorite
    }
    
    var subtitle: String? {
        return category
    }


}
