//
//  ViewController.swift
//  Light
//
//  Created by Scott Nakada on 10/2/18.
//  Copyright © 2018 Scott Nakada. All rights reserved.
//

import UIKit

class ViewController:

UIViewController {
    var lightOn = true
    
    override func viewDidLoad() {
        print("viewDidLoad")
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func bottonPressed(_ sender: Any) {
        lightOn = !lightOn
    
        updateUI()
    
    }
    
    func updateUI() {
        view.backgroundColor = lightOn ? .white : .black
        /*
        if lightOn {
            view.backgroundColor = .white
            //lightButton.setTitle("Turn Off", for: .normal)
        } else {
            view.backgroundColor = .black
            //lightButton.setTitle("Turn On", for: .normal)
        }
 */
    }


}

