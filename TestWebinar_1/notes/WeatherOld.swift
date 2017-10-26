//
//  Weather.swift
//  TestWebinar_1
//
//  Created by Semyon Belokovsky on 26/10/2017.
//  Copyright © 2017 Semyon Belokovsky. All rights reserved.
//

import UIKit
import ObjectMapper

class WeatherOld: Mappable {
    
    var humidity: Int?
    var pressure: Int?
    var temp: Double?
    var tempMax: Double?
    var tempMin: Double?
    var city: String?
    var wind: Double?
    
    init(dictionary: [AnyHashable : Any]) {
        
        // .main
        
        if let mainDict = dictionary["main"] as? [AnyHashable : Any] {
            if let value = mainDict["humidity"] as? Int {
                humidity = value
            }
            if let value = mainDict["pressure"] as? Int {
                pressure = value
            }
            if let value = mainDict["temp"] as? Double {
                temp = value
            }
            if let value = mainDict["temp_max"] as? Double {
                tempMax = value
            }
            if let value = mainDict["temp_min"] as? Double {
                tempMin = value
            }
        }
        
        // .name
        
        if let value = dictionary["name"] as? String {
            city = value
        }
        
        // .wind
        
        if let windDict = dictionary["wind"] as? [AnyHashable : Any] {
            if let value = windDict["speed"] as? Double {
                wind = value
            }
        }
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        humidity <- map["main.humidity"]
        pressure <- map["main.pressure"]
        temp <- map["main.temp"]
        tempMax <- map["main.temp_max"]
        tempMin <- map["main.temp_min"]
        city <- map["name"]
        wind <- map["wind.speed"]
    }
}
