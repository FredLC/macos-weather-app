//
//  WeatherCell.swift
//  Weathered
//
//  Created by Fred Lefevre on 2019-02-11.
//  Copyright © 2019 Fred Lefevre. All rights reserved.
//

import Cocoa

class WeatherCell: NSCollectionViewItem {

    @IBOutlet weak var cellDay: NSTextField!
    @IBOutlet weak var cellImage: NSImageView!
    @IBOutlet weak var highTemp: NSTextField!
    @IBOutlet weak var lowTemp: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.wantsLayer = true
        self.view.layer?.backgroundColor = CGColor(red: 0.69, green: 0.85, blue: 0.99, alpha: 0.5)
        self.view.layer?.cornerRadius = 5
    }
    
    func configureCell(weatherCell: Forecast) {
        cellImage.image = NSImage(named: weatherCell.weatherType)
        highTemp.stringValue = "\(weatherCell.highTemp)"
        lowTemp.stringValue = "\(weatherCell.lowTemp)"
        cellDay.stringValue = weatherCell.date
    }
    
}
