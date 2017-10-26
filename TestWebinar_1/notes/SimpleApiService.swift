//
//  SimpleApiService.swift
//  TestWebinar_1
//
//  Created by Semyon Belokovsky on 26/10/2017.
//  Copyright © 2017 Semyon Belokovsky. All rights reserved.
//

import UIKit

class SimpleApiService: NSObject {
    func loadWeather(query: String, handler: @escaping (Weather?) -> Swift.Void) {
        
        var urlString = "http://api.openweathermap.org/data/2.5/weather";
        
        let appId = "ed26ee17716deb4a461d27a9f4c7049b"
        
        urlString = urlString.appendingFormat("?q=%@", query)
        urlString = urlString.appendingFormat("&appid=%@", appId)
        
        guard let url = URL(string: urlString) else {
            handler(nil)
            return
        }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            var weather: Weather?
            if let data = data {
                do {
                    let value = try JSONSerialization.jsonObject(with: data)
                    if let dictionary = value as? [AnyHashable : Any] {
                        weather = Weather(dictionary: dictionary)
                    }
                } catch {                    
                    handler(nil)
                }
            }
            handler(weather)
        }
        task.resume()
    }
}
