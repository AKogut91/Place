//
//  PlaceModel.swift
//  Place
//
//  Created by AlexanderKogut on 9/13/18.
//  Copyright © 2018 AlexanderKogut. All rights reserved.
//

import Foundation

class PlaceModel {
    
    var lat = Double()
    var long = Double()
    var titel = String()
    var subTitel = String()
    var detailTitel = String()
    var image = String()
    
    init(lat:Double, long: Double, titel: String, subTitel: String, detailTitel: String, image: String) {
        
        self.lat = lat
        self.long = long
        self.titel = titel
        self.subTitel = subTitel
        self.detailTitel = detailTitel
        self.image = image
    }
}

//all loaded Places Object
class PlacesObject {
    static var places = [PlaceModel]()
}
