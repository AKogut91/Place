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
    
    func place(lat: CLLocationDegrees, long: CLLocationDegrees, titel: String, subTitel: String) {
        
        let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
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
