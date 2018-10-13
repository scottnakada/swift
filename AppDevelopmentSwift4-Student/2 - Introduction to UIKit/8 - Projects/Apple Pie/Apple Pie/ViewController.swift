//
//  ViewController.swift
//  Apple Pie
//
//  Created by Scott Nakada on 10/11/18.
//  Copyright © 2018 Scott Nakada. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    /* Outlets */
    @IBOutlet weak var treeImageView: UIImageView!
    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var letterButtons: [UIButton]!
    
    /* Constants and Variables */
    var listOfWords = ["apple", "orange", "banana", "peach", "pineapple", "grapes", "kiwi", "watermelon", "honeydew"]
    let incorrectMovesAllowed = 7   /* Max number of incorrect words allowed */
    var totalWins = 0               /* Total wins so far */
    var totalLosses = 0             /* Total losses so far */
    var currentGame: Game!          /* Pointer to the current game */
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* Start a new round when the game loads */
        newRound()
    }
    
    /* Play a new round of the game */
    func newRound() {
        /* Get the next word from the front of the list of words */
        let newWord = listOfWords.removeFirst()
        /* instantiate a new Game as the current game */
        currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed)
        updateUI()
    }
    
    /* Update the user interface() */
    func updateUI() {
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        sender.isEnabled = false
    }
    
}

