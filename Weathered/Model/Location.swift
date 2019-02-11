//
//  Location.swift
//  Weathered
//
//  Created by Fred Lefevre on 2019-02-11.
//  Copyright © 2019 Fred Lefevre. All rights reserved.
//

import Foundation

class Location {
    
    static var instance = Location()
    
    fileprivate var _latitude: Double!
    fileprivate var _longitude: Double!
    
    var latitude: Double {
        get {
            return _latitude
        } set {
            _latitude = newValue
        }
    }
    
    var longitude: Double {
        get {
            return _longitude
        } set {
            _longitude = newValue
        }
    }
}
