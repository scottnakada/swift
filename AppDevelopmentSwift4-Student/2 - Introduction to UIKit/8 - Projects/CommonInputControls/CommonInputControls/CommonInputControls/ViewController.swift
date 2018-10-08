//
//  ViewController.swift
//  CommonInputControls
//
//  Created by Scott Nakada on 10/8/18.
//  Copyright © 2018 Scott Nakada. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var toggle: UISwitch!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var buttonLabel: UILabel!
    @IBOutlet weak var toggleLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var gestureLabel: UILabel!
    
    var buttonCounter : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //button.addTarget(self, action: #selector(buttonTapped(_:)),
        //    for: .touchUpInside)
        updateTextView()
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        buttonCounter += 1
        buttonLabel.text = String(buttonCounter)
        
        print("The button was tapped \(buttonCounter)")
        
        if toggle.isOn {
            print("The switch is on!")
        } else {
            print("The switch is off.")
        }
        
        print("The slider is set to: \(slider.value)")
        
        if let text = textField.text {
            print("The text field: '\(text)'")
        } else {
            print("The text field: ''")
        }
        
        updateTextView()
        
    }
    
    func updateTextView() {
        var output = "The button was tapped \(buttonCounter) times\n"
        
        if toggle.isOn {
            output += "The switch is on!\n"
        } else {
            output += "The switch is off.\n"
        }
        
        output += "The slider is set to: \(slider.value)\n"
        
        if let text = textField.text {
            output += "The text field: '\(text)'\n"
        } else {
            output += "The text field: ''\n"
        }
        if let gestureText = gestureLabel.text {
             output += gestureText
        }
        textView.text = output
    }
    
    @IBAction func switchToggled(_ sender: UISwitch) {
        if sender.isOn {
            toggleLabel.text = "On"
            print("The switch is on!")
        } else {
            toggleLabel.text = "Off"
            print("The switch is off.")
        }
        updateTextView()
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        sliderLabel.text = String(sender.value)
        print(sender.value)
        updateTextView()
    }
    
    @IBAction func keyboardReturnKeyTapped(_ sender: UITextField) {
        if let text = sender.text {
            textLabel.text = text
            print(text)
            updateTextView()
        }
    }
    
    @IBAction func textChanged(_ sender: UITextField) {
        if let text = sender.text {
            textLabel.text = text
            print(text)
            updateTextView()
        }
    }
    
    @IBAction func respondToTapGesture(_ sender: UITapGestureRecognizer) {
        let location = sender.location(in: view)
        gestureLabel.text = "x: \(location.x)\ny: \(location.y)"
        print(location)
        updateTextView()
    }
    
}

