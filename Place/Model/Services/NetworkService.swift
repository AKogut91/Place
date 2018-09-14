//
//  NetworkService.swift
//  Place
//
//  Created by AlexanderKogut on 9/13/18.
//  Copyright © 2018 AlexanderKogut. All rights reserved.
//

import Foundation

final class NetworkService {

    // Load (GPS, titel, image) information about places
    static func loadPlaceData(placesData: @escaping (NSDictionary) -> ()) {
    
        if let path = Bundle.main.path(forResource: "Places", ofType: "plist") {
            if let dic = NSDictionary(contentsOfFile: path) as? [String: Any] {
                placesData(dic as NSDictionary)
            }
        }
    }
}
