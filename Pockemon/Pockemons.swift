//
//  Pockemons.swift
//  Pockemon
//
//  Created by Asser on 7/15/19.
//  Copyright © 2019 Asser. All rights reserved.
//

import UIKit

class Pockemons {
    var name : String?
    var power : Double?
    var latitude : Double?
    var longitude : Double?
    var details : String?
    var isCatched : Bool?
    var image : String?
    
    init(name : String, power : Double, latitude : Double, longitude : Double, details : String,image : String){
        self.name = name
         self.power = power
         self.latitude = latitude
         self.longitude = longitude
         self.details = details
         self.image =  image
        self.isCatched = false
    }
}
