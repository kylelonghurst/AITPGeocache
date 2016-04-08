//
//  GeocacheDetailViewController.swift
//  The Geocacher
//
//  Created by Kyle Longhurst on 4/8/16.
//  Copyright © 2016 Kyle Longhurst. All rights reserved.
//

import UIKit

class GeocacheDetailViewController: UITableViewController {
    let steakHouse: [String: String] = [
        "title"         : "Gibson's Steakhouse",
        "difficulty"    : "Hard",
        "category"      : "Toys",
        "favorite"      : "false",
        "latitude"      : "41.978372",
        "longitude"     : "-87.862923",
        "clue"          : "Open the door slowly and you'll find it. Be sure to look both directions when you open the door.",
        "size"          : "Small"
    ]
    
    var geolocationObj: Geolocation!
    
    // Outlets
    @IBOutlet weak var geoTitleLabel: UILabel!
    @IBOutlet weak var geoDifficultyLabel: UILabel!
    @IBOutlet weak var geoCategoryLabel: UILabel!
    @IBOutlet weak var geoSizeLabel: UILabel!
    @IBOutlet weak var geoLatitudeLabel: UILabel!
    @IBOutlet weak var geoLongitudeLabel: UILabel!
    @IBOutlet weak var geoClueLabel: UILabel!
    
    //Lifecycle
    
    override func viewDidLoad() {
        print("made it")
        geoTitleLabel.text = geolocationObj.title
        geoDifficultyLabel.text = geolocationObj.difficulty
        geoCategoryLabel.text = geolocationObj.category
        geoSizeLabel.text = geolocationObj.size
        geoLatitudeLabel.text = String(geolocationObj.latitude)
        geoLongitudeLabel.text = String(geolocationObj.longitude)
        geoClueLabel.text = geolocationObj.clue
    }
}
