//
//  ViewController.swift
//  TwoButtons
//
//  Created by Scott Nakada on 10/8/18.
//  Copyright © 2018 Scott Nakada. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func setTextButtonTapped(_ sender: UIButton) {
        if let text = textField.text {
            textLabel.text = text
        }
    }
    
    @IBAction func clearTextButtonTapped(_ sender: UIButton) {
        textLabel.text = ""
    }
    
    
}

