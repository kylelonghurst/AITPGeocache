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
    var latitude: Double
    var longitude: Double
    var category: String
    var coordinate: CLLocationCoordinate2D
//    var viewLatitude: Double?
//    var viewLongitude: Double?
//    var viewTilt: Double?
//    var viewRoll: Double?
//    var viewAltitude: Double?
//    var viewHeading: Double?
    
//    init(id: Int, name: String, latitude: Double, longitude: Double, category: String, viewLatitude: Double?, viewLongitude:Double?, viewTilt: Double?, viewRoll: Double?, viewAltitude: Double?, viewHeading: Double?) {
//        self.id = id
//        self.name = name
//        self.latitude = latitude
//        self.longitude = longitude
//        self.category = category
//        
//        
////        if let vLatitude = viewLatitude {
////            self.viewLatitude = vLatitude
////        }
////        if let vLongitude = viewLongitude {
////            self.viewLongitude = vLongitude
////        }
////        if let vTilt = viewTilt {
////            self.viewTilt = vTilt
////        }
////        if let vRoll = viewRoll {
////            self.viewRoll = vRoll
////        }
////        if let vAltitude = viewAltitude {
////            self.viewAltitude = vAltitude
////        }
////        if let vHeading = viewHeading {
////            self.viewHeading = vHeading
////        }
//    }
    init(id: Int, title: String, category: String, latitude: Double, longitude: Double) {
        self.id = id
        self.title = title
        self.category = category
        self.latitude = latitude
        self.longitude = longitude
        self.coordinate = CLLocationCoordinate2DMake(self.latitude, self.longitude)
        
        super.init()
    }

}
