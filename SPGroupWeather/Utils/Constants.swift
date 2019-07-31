//
//  Constants.swift
//  SPGroupWeather
//
//  Created by PBIDEV on 27/7/19.
//  Copyright © 2019 Piraba. All rights reserved.
//

import Foundation



struct Constants {
    
}

struct APIConstants {
    static let xauthorization   =   "X-Authorization"
    static let API_KEY          =   "key"
    static let contentType      =   "contentType"
    static let searchParam      =   "q"
    static let format           =   "format"
    static let numOfDays        =   "num_of_days"
    
}


struct DBConstants {
    static let userLocation = "UserLocation"
}

struct GeneralConstants {
    static let noNetworkViewIdentifier = "NoNetworkView"
    static let noLoginViewIdentifier   = "NoLoginView"
    static let tapToRetryViewIdentifier = "TapToRetryView"
}

struct ErrorConstant {
    static let tag = 91
}

struct MessageStrings{
    
    static let errorTitle = "Error"
    static let networkErrorTitle = "Network Error"
    
}


struct LocationConstant {
    
    static let areaName    = "areaName"
    static let country     = "country"
    static let region      = "region"
    static let latitude    = "latitude"
    static let longitude   = "longitude"
    static let population  = "population"
    static let weatherUrl  = "weatherUrl"
    static let viewDateTime  = "viewDateTime"
}

