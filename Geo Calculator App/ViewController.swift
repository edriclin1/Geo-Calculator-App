//
//  ViewController.swift
//  Geo Calculator App
//
//  Created by student on 5/15/18.
//  Copyright © 2018 GVSU. All rights reserved.
//

import UIKit

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
    }
    
    @IBAction func clearButtonPressed(_ sender: UIButton) {
    }
}

