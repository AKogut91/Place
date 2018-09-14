//
//  LocationDistanceService.swift
//  Place
//
//  Created by AlexanderKogut on 9/14/18.
//  Copyright © 2018 AlexanderKogut. All rights reserved.
//

import Foundation
import CoreLocation

class LocationDistanceService {
    
    //Set User Location
    static var userLocation: CLLocation {
        return CLLocation(latitude: MapViewController.coord.lat, longitude: MapViewController.coord.long)
    }
    
    //Get all Places Location
    static func placeLocation (lat:CLLocationDegrees, long:CLLocationDegrees) ->  CLLocation{
        return CLLocation(latitude: lat, longitude: long)
    }
    
    //Set User LocationDistance 
    static func distance(to location: CLLocation) -> CLLocationDistance {
        return userLocation.distance(from: self.userLocation)
    }
    
    
}
