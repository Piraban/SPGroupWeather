//
//  UserLocation+CoreDataProperties.swift
//  SPGroupWeather
//
//  Created by PBIDEV on 31/7/19.
//  Copyright © 2019 Piraba. All rights reserved.
//
//

import Foundation
import CoreData


extension UserLocation {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserLocation> {
        return NSFetchRequest<UserLocation>(entityName: "UserLocation")
    }

    @NSManaged public var areaName: String?
    @NSManaged public var country: String?
    @NSManaged public var region: String?
    @NSManaged public var latitude: String?
    @NSManaged public var longitude: String?
    @NSManaged public var weatherUrl: String?

}
