//
//  ParseService.swift
//  Place
//
//  Created by AlexanderKogut on 9/13/18.
//  Copyright © 2018 AlexanderKogut. All rights reserved.
//

import Foundation

final class ParseService {

    // Load (GPS, titel, image) information about our places
    static func parseData (dataDict: NSDictionary) {
        
        for (_ , value) in dataDict {
         
            if let valueDictionary = value as? Dictionary<String, Any> {
                print(valueDictionary.keys)
                
                let lat = valueDictionary["lat"] as! NSNumber
                let long = valueDictionary["long"] as! NSNumber
                let titel = valueDictionary["titel"] as! String
                let subTitel = valueDictionary["subTitel"] as! String
                let detailsTitel = valueDictionary["detailTitel"] as! String
                let image = valueDictionary["image"] as! String
                
                let latDouble = Double(truncating: lat)
                let longDouble = Double(truncating: long)
                
                PlacesObject.places.append(PlaceModel(lat: latDouble,
                                                      long: longDouble,
                                                      titel: titel,
                                                      subTitel: subTitel,
                                                      detailTitel:detailsTitel,
                                                      image: image))
                
            }
        }
    }
}
