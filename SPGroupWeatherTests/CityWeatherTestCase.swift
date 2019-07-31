//
//  CityWeatherTestCase.swift
//  SPGroupWeatherTests
//
//  Created by PBIDEV on 31/7/19.
//  Copyright © 2019 Piraba. All rights reserved.
//

import XCTest
@testable import SPGroupWeather

class CityWeatherTestCase: XCTestCase {
    let cityVM = CityViewModel()
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
    
    func testSearchLocationAPI(){
        cityVM.fetchWeather("Sengkang", 1, { (success, result, error) -> Void in
            if(success) {
                XCTAssert(self.cityVM.weather.humidity == "65")
                XCTAssert(self.cityVM.weather.temp_C == "25")
                XCTAssert(self.cityVM.weather.weatherDesc == "Partly Cloudy")
                
            }
        })
    }

}
