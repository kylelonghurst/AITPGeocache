//
//  ViewController.swift
//  The Geocacher
//
//  Created by Kyle Longhurst on 4/8/16.
//  Copyright © 2016 Kyle Longhurst. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import CoreData

class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    
    @IBOutlet weak var mapView: MKMapView!
    
    //    declare the location manager here
    var locationManager:CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Initilization.initData()
        
        // Show the blue dot to indicate the user location
        mapView.showsUserLocation = true
        
        // go through and set up the location manager
        // start updating the location
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let context: NSManagedObjectContext = appDel.managedObjectContext
        
        let request = NSFetchRequest(entityName: "Geolocation")
        
        request.returnsObjectsAsFaults = false
        
        do {
            
            let results = try context.executeFetchRequest(request)
            
            if results.count > 0 {
                
                for result in results as! [NSManagedObject] {
                    
                    print(result)
                    print(result.valueForKey("category"))
                    
                    let newPin = Geolocation(
                        title: String(result.valueForKey("title")!),
                        difficulty: String(result.valueForKey("difficulty")!),
                        size: String(result.valueForKey("size")!),
                        clue: String(result.valueForKey("clue")!),
                        category: String(result.valueForKey("category")!),
                        favorite: String(result.valueForKey("latitude")!).toBool(),
                        latitude: String(result.valueForKey("latitude")!),
                        longitude: String(result.valueForKey("longitude")!)
                    )
                    
                    mapView.addAnnotation(newPin)
                    
                }
                
            }
            
        } catch {
            
            print("Fetch Failed")
        }

    
        
    
    }
    
    override func viewWillAppear(animated: Bool) {
    }

    
    // this overrides the CLLocationManagerDelegate default method and centers the map on the user's location
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last
        
        let center = CLLocationCoordinate2D(latitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        
        self.mapView.setRegion(region, animated: true)
    }
    
    func mapView(mapView: MKMapView, didUpdateUserLocation userLocation: MKUserLocation) {
        locationManager.stopUpdatingLocation()
    }
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        if let annotation = annotation as? Geolocation {
            let identifier = "pin"
            var view: MKPinAnnotationView
            if let dequeuedView = mapView.dequeueReusableAnnotationViewWithIdentifier(identifier)
                as? MKPinAnnotationView { // 2
                dequeuedView.annotation = annotation
                view = dequeuedView
            } else {
                // 3
                view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                view.canShowCallout = true
                view.calloutOffset = CGPoint(x: -5, y: 5)
//                view.rightCalloutAccessoryView = UIButton.buttonWithType(.DetailDisclosure) as UIView
            }
            return view
        }
        return nil
    }

}

