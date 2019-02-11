//
//  AppDelegate.swift
//  Weathered
//
//  Created by Fred Lefevre on 2019-02-11.
//  Copyright © 2019 Fred Lefevre. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    //Variables
    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        statusItem.button?.title = "--°"
        statusItem.button?.action = #selector(AppDelegate.displayPopUp(_:))
        
        let updateWeatherData = Timer.scheduledTimer(timeInterval: 60 * 15, target: self, selector: #selector(AppDelegate.downloadWeatherData), userInfo: nil, repeats: true)
        updateWeatherData.tolerance = 60
        downloadWeatherData()
    }
    
    @objc func downloadWeatherData() {
        WeatherService.instance.downloadWeatherDetails {
            self.statusItem.button?.title = "\(WeatherService.instance.currentWeather.currentTemp)°"
            WeatherService.instance.downloadForecast(completed: {
                NotificationCenter.default.post(name: NOTIF_DOWNLOAD_COMPLETE, object: nil)
            })
        }
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    @objc func displayPopUp(_ sender: AnyObject?) {
        let storyboard = NSStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateController(withIdentifier: "WeatherVC") as? NSViewController else { return }
        let popoverView = NSPopover()
        popoverView.contentViewController = vc
        popoverView.behavior = .transient
        popoverView.show(relativeTo: statusItem.button!.bounds, of: statusItem.button!, preferredEdge: .minY)
    }

}

