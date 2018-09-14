//
//  MapViewController.swift
//  Place
//
//  Created by AlexanderKogut on 9/13/18.
//  Copyright © 2018 AlexanderKogut. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class MapViewController: UIViewController {
    
    struct Coordinate {
        
        var lat: Double = 0
        var lot: Double = 0
    }
    
    let locationManager = CLLocationManager()
    var coord = Coordinate.init()
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        findUserLocation()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        setPlaces()
    }
    
    private func setPlaces() {
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            
            for places in PlacesObject.places {
                
                let latDegres = CLLocationDegrees(places.lat)
                let longDegres = CLLocationDegrees(places.long)
                print(latDegres)
                self.place(lat: latDegres, long: longDegres, titel: places.titel, subTitel: places.subTitel)
            }
        }
    }
    
   private func place(lat: CLLocationDegrees, long: CLLocationDegrees, titel: String, subTitel: String) {
        
        let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(lat, long)
    
        let region: MKCoordinateRegion = MKCoordinateRegionMake(location, span)
    
        mapView.setRegion(region, animated: true)
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = titel
        annotation.subtitle = subTitel
        mapView.addAnnotation(annotation)
    }

    private func findUserLocation() {
    print("startUpdatingLocation")
    locationManager.delegate = self
    locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
    locationManager.requestWhenInUseAuthorization()
    locationManager.startUpdatingLocation()
    }

}
extension MapViewController : CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        print("get location and stopUpdatingLocation")
        //Get location user
        coord = Coordinate.init(lat: locations[0].coordinate.latitude, lot: locations[0].coordinate.longitude)
        
        coord.lat = coord.lat
        coord.lot = coord.lot
        print("MY location  = \(coord)")
        //locationManager.stopUpdatingLocation()
    }
}
