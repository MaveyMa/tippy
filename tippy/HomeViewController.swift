//
//  HomeViewController.swift
//  tippy
//
//  Created by Mavey Ma on 1/27/18.
//  Copyright © 2018 Mavey Ma. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: Any) {
        //When user taps anywhere outside of the billField, hide keyboard
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        
        let tipPercentages = [0.1, 0.15, 0.18, 0.20]
        
        //Convert billField string into a number
        //If what's on the left of ?? is equal to nil,
        // return 0 as the default value
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        //A special syntax \(variableName) that's like concatenation
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
}

