//
//  Game.swift
//  Apple Pie
//
//  Created by Scott Nakada on 10/12/18.
//  Copyright © 2018 Scott Nakada. All rights reserved.
//

import Foundation

struct Game {
    var word: String
    var incorrectMovesRemaining: Int
    var guessedLetters: [Character]
    
    mutating func playerGuessed(letter: Character) {
        guessedLetters.append(letter)
        if (!word.contains(String(letter))) {
            incorrectMovesRemaining -= 1
        }
    }
}
