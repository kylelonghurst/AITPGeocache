//
//  StringExtension.swift
//  The Geocacher
//
//  Created by  on 4/8/16.
//  Copyright © 2016 . All rights reserved.
//

import Foundation

extension String {
    func toBool() -> Bool {
        switch self {
        case "True", "true", "yes", "1":
            return true
        case "False", "false", "no", "0":
            return false
        default:
            return false
        }
    }
}