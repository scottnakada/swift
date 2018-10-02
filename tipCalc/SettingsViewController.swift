//
//  SettingsViewController.swift
//  tipCalc
//
//  Created by Scott Nakada on 3/13/17.
//  Copyright © 2017 Scott Nakada. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    // Default tip control
    @IBOutlet weak var defaultTipControl: UISegmentedControl!
    
    @IBOutlet var settingsView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Read the default tip from storage
        let defaults = UserDefaults.standard
        let defaultTipVal = defaults.integer(forKey: "defaultTip")
        // Initialize the default tip
        defaultTipControl.selectedSegmentIndex = defaultTipVal
        
        // Animate the view so it will fade in when the view is selected
        self.settingsView.alpha = 0
        UIView.animate(withDuration: 0.6, animations: {
            self.settingsView.alpha = 1
        })

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // Animate the view, so it fades out when the window will disappear
        self.settingsView.alpha = 1
        UIView.animate(withDuration: 0.2, animations: {
            self.settingsView.alpha = 0
        })
    }
    
    // When the default tip has changed
    @IBAction func changeDefaultTip(_ sender: Any) {
        // Store the new default tip index in key defaultTip
        let defaults = UserDefaults.standard
        defaults.set(defaultTipControl.selectedSegmentIndex, forKey: "defaultTip")
        defaults.synchronize()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
