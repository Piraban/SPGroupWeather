//
//  City.swift
//  SPGroupWeather
//
//  Created by PBIDEV on 27/7/19.
//  Copyright © 2019 Piraba. All rights reserved.
//

import Foundation

class Location : Equatable{
    var areaName    : String
    var country     : String
    var region      : String
    var latitude    : String
    var longitude   : String
    var population  : String
    var weatherUrl  : String
    var viewDateTime  : Date
    
    init() {
        self.areaName       = ""
        self.country        = ""
        self.region         = ""
        self.latitude       = ""
        self.longitude      = ""
        self.population     = ""
        self.weatherUrl     = ""
        self.viewDateTime  = Date()
    }
    
    static func ==(lhs: Location, rhs: Location) -> Bool {
        return lhs.areaName == rhs.areaName && lhs.country == rhs.country
    }
}


