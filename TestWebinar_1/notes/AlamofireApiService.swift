//
//  AlamofireApiService.swift
//  TestWebinar_1
//
//  Created by Semyon Belokovsky on 26/10/2017.
//  Copyright © 2017 Semyon Belokovsky. All rights reserved.
//

import UIKit
import Alamofire

class AlamofireApiService: NSObject {
    func loadWeather(query: String, handler: @escaping (Weather?) -> Swift.Void) {
        let appId = "ed26ee17716deb4a461d27a9f4c7049b"
        
        let urlString = "http://api.openweathermap.org/data/2.5/weather";
        
        let params = ["q" : query,
                      "appid" : appId]
        
        Alamofire.request(urlString, method: .get, parameters: params).responseJSON { (response) in
            var weather: Weather?
            if let value = response.result.value as? [String : Any] {
                if let object = Weather(JSON: value) {
                    weather = object
                }
            }
            handler(weather)
        }
        
    }
}
