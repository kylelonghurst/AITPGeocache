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
    @IBAction func filterButtonTapped(sender: AnyObject) {
        showFilter()
    }
    
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
        
        displayAnnotations(false)
    
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
            if let dequeuedView = mapView.dequeueReusableAnnotationViewWithIdentifier(identifier) as? MKPinAnnotationView {
                dequeuedView.annotation = annotation
                view = dequeuedView
            } else {

                view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                view.canShowCallout = true
                
                view.rightCalloutAccessoryView = UIButton.init(type: .DetailDisclosure) as UIButton
            }
            return view
        }
        return nil
    }
    
    func mapView(mapView: MKMapView, annotationView: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if control == annotationView.rightCalloutAccessoryView {
            let geolocationObj = annotationView.annotation as! Geolocation
            performSegueWithIdentifier("GeocacheDetail", sender: geolocationObj)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        // Create a variable that you want to send
        let destinationVC = segue.destinationViewController as! GeocacheDetailViewController
        destinationVC.geolocationObj = sender as! Geolocation
        
    }
    
    func displayAnnotations(favorites: Bool)
    {
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
                        favorite: String(result.valueForKey("favorite")!).toBool(),
                        latitude: String(result.valueForKey("latitude")!),
                        longitude: String(result.valueForKey("longitude")!)
                    )
                    
                    print(newPin.favorite)
                    
                    if ((favorites == true && newPin.favorite == true) || favorites == false)
                    {
                        mapView.addAnnotation(newPin)
                    }

                }
                
            }
            
        } catch {
            
            print("Fetch Failed")
        }

    }
    
    func showFilter()
    {
        let alertController = UIAlertController(title: "Choose Filter", message: nil, preferredStyle:UIAlertControllerStyle.ActionSheet)
        
        alertController.addAction(UIAlertAction(title: "All", style: UIAlertActionStyle.Default)
        { action -> Void in
                    self.mapView.removeAnnotations(self.mapView.annotations)
                    self.displayAnnotations(false)
            })
        alertController.addAction(UIAlertAction(title: "Favorites", style: UIAlertActionStyle.Default)
        { action -> Void in
                    self.mapView.removeAnnotations(self.mapView.annotations)
                    self.displayAnnotations(true)
            })
        self.presentViewController(alertController, animated: true, completion: nil)
    }
}



