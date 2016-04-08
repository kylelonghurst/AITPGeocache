//
//  GeoLocationImage.swift
//  The Geocacher
//
//  Created by Kyle Longhurst on 4/8/16.
//  Copyright © 2016 Kyle Longhurst. All rights reserved.
//

import UIKit

class GeoLocationImage {
    var imageData: NSData
    
    init(imageData: NSData) {
        self.imageData = imageData
    }
    
    init(imageData: UIImage) {
        self.imageData = imageData.lowQualityJPEGNSData
    }
}