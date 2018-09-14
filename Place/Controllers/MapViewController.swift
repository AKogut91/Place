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
        
        var lat: CLLocationDegrees = 0
        var long: CLLocationDegrees = 0
    }
    
    private let locationManager = CLLocationManager()
    static var coord = Coordinate()
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        startUpdatingUserLocation()
    }
    
    private func setPlaces() {
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            
            for places in PlacesObject.places {
                
                let latDegres = CLLocationDegrees(places.lat)
                let longDegres = CLLocationDegrees(places.long)
                print(latDegres)
                self.setPlaceToMap(lat: latDegres, long: longDegres, titel: places.titel, subTitel: places.subTitel)
            }
        }
    }
    
    //Add point to Map with Titel and subtitle
    private func setPlaceToMap(lat: CLLocationDegrees, long: CLLocationDegrees, titel: String, subTitel: String) {
        
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
    
    private func startUpdatingUserLocation() {
        print("startUpdatingLocation")
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        setPlaces()
    }
}

extension MapViewController : CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        //Get location user
        MapViewController.coord = Coordinate.init(lat: locations[0].coordinate.latitude, long: locations[0].coordinate.longitude)
        
        MapViewController.coord.lat = MapViewController.coord.lat
        MapViewController.coord.long = MapViewController.coord.long
        //locationManager.stopUpdatingLocation()
    }
}
