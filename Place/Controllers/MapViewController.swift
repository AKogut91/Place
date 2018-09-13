//
//  MapViewController.swift
//  Place
//
//  Created by AlexanderKogut on 9/13/18.
//  Copyright © 2018 AlexanderKogut. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        setPlaces()
    }
    
    private func setPlaces() {
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
            
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
}
