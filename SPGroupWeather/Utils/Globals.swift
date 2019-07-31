//
//  Globals.swift
//  SPGroupWeather
//
//  Created by PBIDEV on 27/7/19.
//  Copyright © 2019 Piraba. All rights reserved.
//

import Foundation


class Globals{
    static var sharedInstance = Globals()
    
    var authToken           : String
    var userId              : String
    var username            : String
    var contentType         : String
    var API_KEY             : String
    var format              : String
    
    
    init() {
        self.authToken      = ""
        self.userId         = ""
        self.username       = ""
        self.contentType    = "application/json"
        self.API_KEY        = "87194ddc870a4a9ebf261324192707"
        self.format         = "json"
        
    }
}
