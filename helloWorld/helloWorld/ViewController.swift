//
//  ViewController.swift
//  helloWorld
//
//  Created by Scott Nakada on 3/29/17.
//  Copyright © 2017 Scott Nakada. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
  @IBOutlet weak var HelloLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        HelloLabel.text = "Whatever dynamic stuff"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



}

