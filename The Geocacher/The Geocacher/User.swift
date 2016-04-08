//
//  User.swift
//  The Geocacher
//
//  Created by  on 4/8/16.
//  Copyright © 2016 . All rights reserved.
//

import UIKit

class User {
    var firstName: String
    var lastName: Double
    var email: Double
    var password: String
    var image: UIImage?
    var imageData: NSData
    
    init(firstName: String, lastName: Double, email: Double, password: String, image: UIImage?, imageData: NSData) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.password = password
        if let profImage = image {
            self.image = profImage
        }
        self.imageData = imageData
    }
}