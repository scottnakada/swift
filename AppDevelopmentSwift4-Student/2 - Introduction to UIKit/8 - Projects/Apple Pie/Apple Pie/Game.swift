//
//  Game.swift
//  Apple Pie
//
//  Created by Scott Nakada on 10/12/18.
//  Copyright © 2018 Scott Nakada. All rights reserved.
//

import Foundation

struct Game {
    var word: String                    /* Word for this game */
    var incorrectMovesRemaining: Int    /* Moves left */
    var guessedLetters: [Character]     /* Letters guessed so far */
    
    /* Players guesses a letter */
    mutating func playerGuessed(letter: Character) {
        /* Store the letter guessed */
        guessedLetters.append(letter)
        /* Decrement the moves remaining count if letter not in word */
        if (!word.contains(String(letter))) {
            incorrectMovesRemaining -= 1
        }
    }
    
    var formattedWord: String {
        var guessedWord = ""
        for letter in Array(word) {
            if guessedLetters.contains(letter) {
                guessedWord += "\(letter)"
            } else {
                guessedWord += "_"
            }
        }
        return guessedWord
    }
    
    
}
