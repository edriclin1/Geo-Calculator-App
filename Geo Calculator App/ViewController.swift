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
            
            // create points from latitudes and longitudes
            var p1: CLLocation = CLLocation(latitude: Double(self.p1LatField.text!)!, longitude: Double(self.p1LongField.text!)!)
            var p2: CLLocation = CLLocation(latitude: Double(self.p2LatField.text!)!, longitude: Double(self.p2LongField.text!)!)
            
            // calculate distance between p1 and p2
            
        }
    }
    
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        p1LatField.text = ""
        p2LatField.text = ""
        p1LongField.text = ""
        p2LongField.text = ""
    }
}

