//
//  ViewController.swift
//  TestWebinar_1
//
//  Created by Semyon Belokovsky on 25/10/2017.
//  Copyright © 2017 Semyon Belokovsky. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cityLabel: UILabel?
    @IBOutlet weak var tempLabel: UILabel?
    @IBOutlet weak var tempMinLabel: UILabel?
    @IBOutlet weak var tempMaxLabel: UILabel?
    @IBOutlet weak var humidityLabel: UILabel?
    @IBOutlet weak var pressureLabel: UILabel?
    
    @IBOutlet weak var textField: UITextField?
    
    var weather: Weather?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    fileprivate func loadWeather(query: String) {
//        let simpleApiService = SimpleApiService()
//        simpleApiService.loadWeather(query: query) { (weather) in
//            self.weather = weather
//            DispatchQueue.main.async {
//                self.updateUI()
//            }
//        }
        
        let alamofireApiService = AlamofireApiService()
        alamofireApiService.loadWeather(query: query) { (weather) in
            self.weather = weather
            self.updateUI()
        }
    }
    
    fileprivate func updateUI() {
        cityLabel?.text = weather?.city
        if let value = weather?.temp {
            tempLabel?.text = String(value)
        } else {
            tempLabel?.text = ""
        }
        
        if let value = weather?.tempMin {
            tempMinLabel?.text = String(value)
        } else {
            tempMinLabel?.text = ""
        }
        
        if let value = weather?.tempMax {
            tempMaxLabel?.text = String(value)
        } else {
            tempMaxLabel?.text = ""
        }
        
        if let value = weather?.humidity {
            humidityLabel?.text = String(value)
        } else {
            humidityLabel?.text = ""
        }
        
        if let value = weather?.pressure {
            pressureLabel?.text = String(value)
        } else {
            pressureLabel?.text = ""
        }
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let query = textField.text {
            textField.resignFirstResponder()
            
            loadWeather(query: query)
        }
        return true
    }
}

