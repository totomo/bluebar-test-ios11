//
//  ViewController.swift
//  locationtest
//
//  Created by Kenta Tokumoto on 2017/08/09.
//  Copyright © 2017年 Kenta Tokumoto. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    @IBOutlet private weak var label: UILabel! {
        didSet {
            label.text = nil
        }
    }
    @IBOutlet private weak var `switch`: UISwitch!
    private var labelText: String {
        return "showsBackgroundLocationIndicator: \(self.switch.isOn)"
    }
    private let locationManager: CLLocationManager = {
        let locationManager = CLLocationManager()
        if CLLocationManager.authorizationStatus() != .authorizedAlways {
            locationManager.requestAlwaysAuthorization()
        }
        locationManager.allowsBackgroundLocationUpdates = true
        return locationManager
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.startUpdatingLocation()
        label.text = labelText
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc @IBAction private func didSelectSwitch(_ sender: UISwitch) {
        locationManager.showsBackgroundLocationIndicator = sender.isOn
        label.text = labelText
    }

}

