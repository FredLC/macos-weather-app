//
//  NSDate.swift
//  Weathered
//
//  Created by Fred Lefevre on 2019-02-11.
//  Copyright © 2019 Fred Lefevre. All rights reserved.
//

import Foundation

extension Date {
    
    func dayOfTheWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
    
}
