//
//  ViewController.swift
//  IBBasics
//
//  Created by Scott Nakada on 10/2/18.
//  Copyright © 2018 Scott Nakada. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myButton: UIButton!
    @IBAction func buttonPressed(_ sender: Any) {
        print("The button was pressed")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myButton.setTitleColor(.red, for: .normal)
    }


}

