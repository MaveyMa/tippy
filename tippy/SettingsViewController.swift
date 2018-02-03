//
//  SettingsViewController.swift
//  tippy
//
//  Created by Mavey Ma on 1/28/18.
//  Copyright © 2018 Mavey Ma. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
  
  //Access UserDefaults
  let defaults = UserDefaults.standard
  @IBOutlet weak var defaultTipPickerView: UIPickerView!
  var pickerData: [String] = [String]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    // Connect data:
    defaultTipPickerView.delegate = self
    defaultTipPickerView.dataSource = self
    
    // Input data into the Array:
    pickerData = ["10%", "15%", "18%", "20%"]
    
    let intValue = defaults.integer(forKey: "myIndexOfDefaultTipArray")
    defaultTipPickerView.selectRow(intValue, inComponent: 0, animated: false)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  /**
   * Summary: Helper functions from PickerView tutorial
   * Source: https://codewithchris.com/uipickerview-example/
   * Author: Code snippet by Chris, Aug 26 '15
   */
  // The number of columns of data
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }
  
  // The number of rows of data
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return pickerData.count
  }
  
  // The data to return for the row and component (column) that's being passed in
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return pickerData[row]
  }
  
  // Catpure the picker view selection
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    // This method is triggered whenever the user makes a change to the picker selection.
    // The parameter named row and component represents what was selected.
    
    // Set a String value for some key.
    defaults.set(row, forKey: "myIndexOfDefaultTipArray")
    
    // Force UserDefaults to save.
    defaults.synchronize()
  }
  
  
}
