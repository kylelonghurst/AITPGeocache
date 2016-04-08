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
    var id: Int
    var title: String?
    var category: String?
    
    var latitude: Double
    var longitude: Double
    var coordinate: CLLocationCoordinate2D

    init(id: Int, title: String, category: String, latitude: Double, longitude: Double) {
        self.id = id
        self.title = title
        self.category = category
        self.latitude = latitude
        self.longitude = longitude
        self.coordinate = CLLocationCoordinate2DMake(self.latitude, self.longitude)
        
        super.init()
    }
    
    var subtitle: String? {
        return category
    }


}
