//
//  WeatherVC.swift
//  Weathered
//
//  Created by Fred Lefevre on 2019-02-11.
//  Copyright © 2019 Fred Lefevre. All rights reserved.
//

import Cocoa

class WeatherVC: NSViewController {

    @IBOutlet weak var dateLabel: NSTextField!
    @IBOutlet weak var temperatureLabel: NSTextField!
    @IBOutlet weak var locationLabel: NSTextField!
    @IBOutlet weak var weatherImage: NSImageView!
    @IBOutlet weak var weatherConditionLabel: NSTextField!
    @IBOutlet weak var collectionView: NSCollectionView!
    @IBOutlet weak var poweredByButton: NSButton!
    @IBOutlet weak var quitButton: NSButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    override func viewDidAppear() {
        NotificationCenter.default.addObserver(self, selector: #selector(WeatherVC.dataDownloadedNotif(_:)), name: NOTIF_DOWNLOAD_COMPLETE, object: nil)
        self.view.layer?.backgroundColor = CGColor(red: 0.29, green: 0.72, blue: 0.98, alpha: 1.00)
        updateUI()
        quitButton.styleButtonText(button: quitButton, buttonName: "Quit", fontColor: .white, alignment: .center, font: "Avenir Next", size: 11)
        poweredByButton.styleButtonText(button: poweredByButton, buttonName: "Powered by OpenWeatherMap", fontColor: .white, alignment: .center, font: "Avenir Next", size: 11)
    }
    
    override func viewDidDisappear() {
        NotificationCenter.default.removeObserver(self, name: NOTIF_DOWNLOAD_COMPLETE, object: nil)
    }
    
    @objc func dataDownloadedNotif(_ notif: Notification) {
        updateUI()
        print("notification to update UI")
    }
    
    @IBAction func poweredByButtonClicked(_ sender: Any) {
        let url = URL(string: API_HOMEPAGE)!
        NSWorkspace.shared.open(url)
    }
    
    @IBAction func quitButtonClicked(_ sender: Any) {
        NSApplication.shared.terminate(nil)
    }
    
    func updateUI() {
        let weather = WeatherService.instance.currentWeather
        dateLabel.stringValue = weather.date
        temperatureLabel.stringValue = "\(weather.currentTemp)°"
        locationLabel.stringValue = weather.cityName
        weatherConditionLabel.stringValue = weather.weatherType
        weatherImage.image = NSImage(named: weather.weatherType)
        collectionView.reloadData()
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

extension WeatherVC: NSCollectionViewDelegate, NSCollectionViewDataSource, NSCollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        let forecastItem = collectionView.makeItem(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "WeatherCell"), for: indexPath)
        guard let forecastCell = forecastItem as? WeatherCell else { return forecastItem }
        forecastCell.configureCell(weatherCell: WeatherService.instance.forecast[indexPath.item])
        return forecastCell
    }
    
    func numberOfSections(in collectionView: NSCollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return WeatherService.instance.forecast.count
    }
    
    func collectionView(_ collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> NSSize {
        return NSSize(width: 125, height: 125)
    }
}

