//
//  CurrentWeather.swift
//  Weathered
//
//  Created by Fred Lefevre on 2019-02-11.
//  Copyright © 2019 Fred Lefevre. All rights reserved.
//

import Foundation
import SwiftyJSON

class CurrentWeather {
    fileprivate var _cityName: String!
    fileprivate var _date: String!
    fileprivate var _weatherType: String!
    fileprivate var _currentTemp: Int!
    
    var cityName: String {
        get {
            return _cityName
        } set{
            _cityName = newValue
        }
    }
    
    var date: String {
        get {
            return _date
        } set {
            _date = newValue
        }
    }
    
    var weatherType: String {
        get {
            return _weatherType
        } set {
            _weatherType = newValue
        }
    }
    
    var currentTemp: Int {
        get {
            return _currentTemp
        } set {
            _currentTemp = newValue
        }
    }
    
    class func loadCurrentWeatherFromData(_ APIData: Data) -> CurrentWeather {
        let currentWeather = CurrentWeather()
        
        do {
            let json = try JSON(data: APIData)
            currentWeather.cityName = json["name"].stringValue.capitalized
            currentWeather.weatherType = json["weather"][0]["main"].stringValue.capitalized
            currentWeather.currentTemp = json["main"]["temp"].intValue
        } catch let error as NSError {
            print(error)
        }
        
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        let currentDate = formatter.string(from: Date())
        currentWeather.date = "Today, \(currentDate)"
        
        return currentWeather
    }
    
}
