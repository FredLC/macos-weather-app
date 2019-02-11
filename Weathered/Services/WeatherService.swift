//
//  WeatherService.swift
//  Weathered
//
//  Created by Fred Lefevre on 2019-02-11.
//  Copyright © 2019 Fred Lefevre. All rights reserved.
//

import Foundation
import Alamofire

class WeatherService {
    
    static let instance = WeatherService()
    fileprivate var _currentWeather = CurrentWeather()
    fileprivate var _forecast = [Forecast]()
    
    var currentWeather: CurrentWeather {
        get {
            return _currentWeather
        } set {
            _currentWeather = newValue
        }
    }
    
    var forecast: [Forecast] {
        get {
            return _forecast
        } set {
            _forecast = newValue
        }
    }
    
    func downloadWeatherDetails(completed: @escaping DownloadComplete) {
        let url = URL(string: API_URL_CURRENT_WEATHER)
        Alamofire.request(url!).responseData { (response) in
            self.currentWeather = CurrentWeather.loadCurrentWeatherFromData(response.data!)
            completed()
        }
    }
    
    func downloadForecast(completed: @escaping DownloadComplete) {
        let url = URL(string: API_URL_FORECAST)
        Alamofire.request(url!).responseData { (response) in
            self.forecast = Forecast.loadForecastFromData(response.data!)
            if self.forecast.count > 0 {
                self.forecast.remove(at: 0)
            }
            completed()
        }
    }
}
