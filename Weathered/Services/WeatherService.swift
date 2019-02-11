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
    
    func downloadWeatherDetails() {
        let url = URL(string: API_URL_CURRENT_WEATHER)
        Alamofire.request(url!).responseJSON { (response) in
            print(response.result.value ?? "")
        }
    }
}
