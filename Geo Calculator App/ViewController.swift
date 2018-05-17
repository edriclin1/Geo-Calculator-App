//
//  ViewController.swift
//  Geo Calculator App
//
//  Created by student on 5/15/18.
//  Copyright © 2018 GVSU. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    @IBOutlet weak var p1LatField: DecimalMinusTextField!
    @IBOutlet weak var p2LatField: DecimalMinusTextField!
    @IBOutlet weak var p1LongField: DecimalMinusTextField!
    @IBOutlet weak var p2LongField: DecimalMinusTextField!
    
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var bearingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // dismiss keyboard when tapping outside oftext fields
        let detectTouch = UITapGestureRecognizer(target: self, action:
            #selector(self.dismissKeyboard))
        self.view.addGestureRecognizer(detectTouch)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        
        // used to check for valid points
        var pointsOk: Bool = false
        
        // if optionals not nil
        if let p1Lat = self.p1LatField.text, let p1Long = self.p1LongField.text, let p2Lat = self.p2LatField.text, let p2Long = self.p2LongField.text {
            
            // if text fields not empty strings
            if p1Lat != "", p1Long != "", p2Lat != "", p2Long != "" {
                
                // all points valid
                pointsOk = true
            }
        }
        
        // if all points valid
        if pointsOk {
            
            // create CLLocation (points) from latitudes and longitudes
            let p1: CLLocation = CLLocation(latitude: Double(self.p1LatField.text!)!, longitude: Double(self.p1LongField.text!)!)
            let p2: CLLocation = CLLocation(latitude: Double(self.p2LatField.text!)!, longitude: Double(self.p2LongField.text!)!)
            
            // calculate and set distance between p1 and p2 in km. round to 2 decimal places
            var distance: Double = p1.distance(from: p2) / 1000
            distance = (distance * 100).rounded() / 100
            self.distanceLabel.text = "Distance: \(distance)"
            
            // calculate and set bearing between p1 and p2 in decimal degrees
            var bearing: Double = p1.bearingToPoint(point: p2)
            bearing = (bearing * 100).rounded() / 100
            self.bearingLabel.text = "Bearing: \(bearing)"
        } else {
            self.distanceLabel.text = "Distance:"
            self.bearingLabel.text = "Bearing:"
            
        }
    }
    
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        p1LatField.text = ""
        p2LatField.text = ""
        p1LongField.text = ""
        p2LongField.text = ""
    }
    
    @IBAction func settingsButtonPressed(_ sender: UIButton) {
    }
    
}

