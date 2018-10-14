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
    var listOfWords = ["apple",
                       "apricots",
                       "banana",
                       "blackcurrant",
                       "blueberries",
                       "breadfruit",
                       "cataloupe",
                       "cherimoya",
                       "cherries",
                       "clementine",
                       "coconut",
                       "cranberries",
                       "durian",
                       "elderberries",
                       "figs",
                       "gooseberries",
                       "grapefruit",
                       "grapes",
                       "guava",
                       "honeydew",
                       "jackfruit",
                       "kiwi",
                       "kumquat",
                       "lemon",
                       "lime",
                       "lychee",
                       "mandarin",
                       "mango",
                       "mulberries",
                       "nectarine",
                       "olives",
                       "orange",
                       "papaya",
                       "passionfruit",
                       "peach",
                       "pear",
                       "persimmon",
                       "pineapple",
                       "plantain",
                       "plums",
                       "pomegranate",
                       "prune",
                       "quince",
                       "raspberries",
                       "rhubarb",
                       "strawberries",
                       "tamarind",
                       "tangerine",
                       "watermelon"
    ]
    let incorrectMovesAllowed = 7   /* Max number of incorrect words allowed */
    var totalWins = 0 {             /* Total wins so far */
        didSet {
            newRound()              /* Start a new round whenever this is set */
        }
    }
    var totalLosses = 0 {           /* Total losses so far */
        didSet {
            newRound()              /* Start a new round whenever this is set */
        }
    }
    var currentGame: Game!          /* Pointer to the current game */
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* Start a new round when the game loads */
        newRound()
    }
    
    /* Play a new round of the game */
    func newRound() {
        if !listOfWords.isEmpty {
        /* Get the next word from the front of the list of words */
        //let newWord = listOfWords.removeFirst()
        let wordIndex = Int.random(in: 0..<listOfWords.count)
        let newWord = listOfWords[wordIndex]
        listOfWords.remove(at: wordIndex)
        /* instantiate a new Game as the current game */
        currentGame = Game(word: newWord,
                           incorrectMovesRemaining: incorrectMovesAllowed,
                           guessedLetters: [])
        enableLetterButtons(true)
        updateUI()
        } else {
            updateUI()
            if totalWins > totalLosses {
                correctWordLabel.text = "Congratulations!!! You won more than lost."
            } else {
                correctWordLabel.text = "Game Over.  Keep practicing!"
            }
            enableLetterButtons(false)
        }
    }
    
    func enableLetterButtons(_ enable: Bool) {
        for button in letterButtons {
            button.isEnabled = enable
        }
    }
    
    /* Update the user interface() */
    func updateUI() {
        /* Put spaces between the letters to make it easier to read */
        var letters = [String]()
        /* Split the word into a array of strings with each letter */
        for letter in Array(currentGame.formattedWord) {
            letters.append(String(letter))
        }
        let wordWithSpacing = letters.joined(separator: " ")
        
        /* Update the word area on the screen */
        correctWordLabel.text = "Guess the word before all the apples fall: " + wordWithSpacing
        /* Update the scores */
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        /* Change the tree image */
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
    }

    /* Handle when a letter button is pressed */
    @IBAction func buttonPressed(_ sender: UIButton) {
        /* Disable the key that was just pressed */
        sender.isEnabled = false
        /* The the button title, to extract the letter code for the key pressed */
        let letterString = sender.title(for: .normal)!
        /* Convert the string to a char and lowercase for comparing letters */
        let letter = Character(letterString.lowercased())
        /* Play the letter for the button pressed */
        currentGame.playerGuessed(letter: letter)
        /* Update the game state */
        updateGameState()
    }
    
    func updateGameState() {
        if currentGame.incorrectMovesRemaining == 0 {
            totalLosses += 1
        } else if currentGame.word == currentGame.formattedWord {
            totalWins += 1
        } else {
            updateUI()
        }
    }
    
    
    
}

