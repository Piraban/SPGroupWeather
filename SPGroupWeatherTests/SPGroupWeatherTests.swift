//
//  SPGroupWeatherTests.swift
//  SPGroupWeatherTests
//
//  Created by PBIDEV on 31/7/19.
//  Copyright © 2019 Piraba. All rights reserved.
//

import XCTest
@testable import SPGroupWeather


class SPGroupWeatherTests: XCTestCase {
    let homeSearchVM = HomeSearchViewModel()
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    
    func testUserViewedLocations(){
         try! homeSearchVM.fetchUserLocations()
        let location : Location = Location()
        
        location.areaName = "Sengkang"
        location.country = "Singapore"
        location.latitude = "1.12"
        location.longitude = "100.1222"
        location.region = ""
        location.weatherUrl = ""
        
//        userlocation.setValue("Sengkang", forKeyPath: LocationConstant.areaName)
//        userlocation.setValue("Singapore", forKeyPath: LocationConstant.country)
//        userlocation.setValue("10.12", forKeyPath: LocationConstant.latitude)
//        userlocation.setValue("100.1222", forKeyPath: LocationConstant.longitude)
//        userlocation.setValue("", forKeyPath: LocationConstant.weatherUrl)
//        userlocation.setValue("", forKeyPath: LocationConstant.region)
//
     //   XCTAssertTrue(<#T##expression: Bool##Bool#>, <#T##message: String##String#>)
       XCTAssertEqual(homeSearchVM.locations[0], location, "the array should be sorted properly")


    }
    
    
    func testInsertUserLocationToDB(){
        let location : Location = Location()
        location.areaName = "Sengkang"
        location.country = "Singapore"
        location.latitude = "1.12"
        location.longitude = "100.1222"
        location.region = ""
        location.weatherUrl = ""

        XCTAssertNil(try! homeSearchVM.insertLocation(location: location))
    }
    
    func testUserViewLocationsCount(){
        try! homeSearchVM.fetchUserLocations()
        XCTAssertTrue( homeSearchVM.locations.count == 5)
        
    }
    
    func fetchUserViewedLocations(){
        try! homeSearchVM.fetchUserLocations()
        
        XCTAssert(homeSearchVM.locations[0].areaName == "Serangoon" )
        XCTAssert(homeSearchVM.locations[0].country == "Singapore" )
        
    }
    
    
    func testSearchLocationAPI(){
        //call API
        homeSearchVM.searchLocation("Serangoon", { (success, result, error) -> Void in
            if(success) {
                self.homeSearchVM.locations.removeAll()
                if(result.count > 0){
                    self.homeSearchVM.locations = result
                }
                
                XCTAssertNil(result)
                XCTAssert(self.homeSearchVM.locations[0].areaName == "Serangoon")
                XCTAssert(self.homeSearchVM.locations[0].country == "Singapore")
                
                
            }
        })
        
    }

}
