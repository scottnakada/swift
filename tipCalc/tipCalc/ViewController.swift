//
//  ViewController.swift
//  tipCalc
//
//  Created by Scott Nakada on 3/13/17.
//  Copyright © 2017 Scott Nakada. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!       // tip label
    @IBOutlet weak var totalLabel: UILabel!     // total label
    @IBOutlet weak var billField: UITextField!  // bill input field
    @IBOutlet weak var tipControl: UISegmentedControl!  // tip control toggle
    @IBOutlet var tipCalcView: UIView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Set the bill field as the first responder (focus) when this screen appears
        billField.becomeFirstResponder()
        
        // Read the default tip from storage
        let defaults = UserDefaults.standard
        let defaultTipVal = defaults.integer(forKey: "defaultTip")
        // Set the current tip amount to the value from storage
        tipControl.selectedSegmentIndex = defaultTipVal
        // Recompute the tip based on the default tip value
        computeTip()
        
        // Animate the view, so it fades in when the window will appear
        self.tipCalcView.alpha = 0
        UIView.animate(withDuration: 0.6, animations: {
            self.tipCalcView.alpha = 1
        })
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // Animate the view, so it fades out when the window will disappear
        self.tipCalcView.alpha = 1
        UIView.animate(withDuration: 0.2, animations: {
            self.tipCalcView.alpha = 0
        })
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("view did load")
        
        // Read the default tip from storage
        let defaults = UserDefaults.standard
        let defaultTipVal = defaults.integer(forKey: "defaultTip")
        // Set the current tip amount to the value from storage
        tipControl.selectedSegmentIndex = defaultTipVal

        // Read the old bill and bill time from storage
        let oldBill = defaults.double(forKey: "oldBill")
        let billTime:NSDate = (defaults.object(forKey: "billTime") as! NSDate)
        
        // Set the current tip amount to the value from storage
        // If the billTime is less than 10 minutes from now
        if (-billTime.timeIntervalSinceNow < 600) {
            // If the old bill is 0, then leave field blank
            if (oldBill == 0) {
                billField.text = ""
            } else {
                // Restore the old bill value
                billField.text = String(format: "%.2f", oldBill)
            }
            // Initialize the tip and total amounts based on the old bill
            computeTip()
        }

    }

    // Handle memory warnings
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        print("Memory Warning")
    }
    
    // Format currency based on the current locale of the device
    func formatCurrency(value: Double) -> String {
        // Create a NumberFormatter object, set the number style to currency, max digits 2
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 2;
        // Set the locale for the currency conversion to the locale of the device
        formatter.locale = Locale(identifier: Locale.current.identifier)
        // Some tests for other locales
        //formatter.locale = Locale(identifier: "en_GB")
        //formatter.locale = Locale(identifier: "ja_JP")
        //formatter.locale = Locale(identifier: "es_BO")
        formatter.locale = Locale(identifier: "de_DE")
        
        // Format the result string using the value and the formatter
        let result = formatter.string(from: value as NSNumber);
        // Return the formatted currency string
        return result!;
    }
    
    // Compute the tip in a common function
    func computeTip() {
        // Tip percentages array
        let tipPercentages = [0.12, 0.15, 0.18]
        
        // Convert the bill field to a number, and default to 0
        let bill = Double(billField.text!) ?? 0
        
        // Store the new bill as oldBill
        let defaults = UserDefaults.standard
        defaults.set(bill, forKey: "oldBill")
        let billTime = NSDate()
        defaults.set(billTime, forKey: "billTime")
        defaults.synchronize()
        
        // Calculate the tip and total from the bill
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        // set the tip and total labels to the calculated values
        tipLabel.text = formatCurrency(value: tip)
        totalLabel.text = formatCurrency(value: total)

    }
    
    // Calculate the tip and update fields when editing changes the value of the bill
    @IBAction func calculateTip(_ sender: Any) {
        
        // Compute the tip
        computeTip()
        
    }
    
    // When the screen is tapped
    @IBAction func onTap(_ sender: Any) {
        // Close the keyboard
        view.endEditing(true)
    }
    
}

