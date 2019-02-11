//
//  WeatherVC.swift
//  Weathered
//
//  Created by Fred Lefevre on 2019-02-11.
//  Copyright © 2019 Fred Lefevre. All rights reserved.
//

import Cocoa

class WeatherVC: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear() {
        self.view.layer?.backgroundColor = CGColor(red: 0.29, green: 0.72, blue: 0.98, alpha: 1.00)
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

