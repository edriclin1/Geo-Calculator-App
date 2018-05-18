//
//  SettingsViewController.swift
//  Geo Calculator App
//
//  Created by student on 5/17/18.
//  Copyright © 2018 GVSU. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate  {

    @IBOutlet weak var distanceUnitsLabel: UILabel!
    @IBOutlet weak var bearingUnitsLabel: UILabel!
    @IBOutlet weak var unitsPickerView: UIPickerView!
    
    var pickerData: [String] = [String]()
    var selection : String = "Steak"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // open uipickerview for distance when distance label clicked
        let detectDistanceTouch = UITapGestureRecognizer(target: self, action:
            #selector(self.showDistanceUnitsPickerView))
        self.distanceUnitsLabel.addGestureRecognizer(detectDistanceTouch)
        
        // open uipickerview for bearing when bearing label clicked
        let detectBearingTouch = UITapGestureRecognizer(target: self, action:
            #selector(self.showBearingUnitsPickerView))
        self.bearingUnitsLabel.addGestureRecognizer(detectBearingTouch)
        
        self.unitsPickerView.delegate = self
        self.unitsPickerView.dataSource = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func showDistanceUnitsPickerView() {
        self.pickerData = ["Kilometers", "Miles"]
        self.unitsPickerView.isHidden = false
    }

    @objc func showBearingUnitsPickerView() {
        self.pickerData = ["Degrees", "Mils"]
        self.unitsPickerView.isHidden = false
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func numberOfComponents(in: UIPickerView) -> Int
    {
        return 1
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return self.pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        self.selection = self.pickerData[row]
    }
}
