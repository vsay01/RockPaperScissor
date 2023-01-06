//
//  Model.swift
//  RockPaperScissors
//
//  Created by vsay on 1/6/23.
//


// This structure is created to contains game data variables
import Foundation

struct GameData{
    var moveArray = ["Rock", "Paper", "scissors"]
    var winningMoveImgArray = ["hand.raised.fill", "scissors", "circle.fill"] // this is the name from sf symbol
    var winningMoveArray = ["Paper", "Scissor", "Rock"]
    var losingMoveArray = ["Scissor", "Rock", "Paper"]
    var numberOfRound = 0
    var score = 0
    var result = ""
    var isShowingResult = false
    var isShowingEndGame = false
    var aiCurrentMove = Int.random(in: 0...2)
    var isPlayerNeedToWin = Bool.random()
    
    mutating func increaseNumberOfRound() {
        numberOfRound += 1
    }
    
    mutating func increaseScore() {
        score += 1
    }
    
    // reset everything
    mutating func reset() {
        numberOfRound = 0
        score = 0
        result = ""
        isShowingResult = false
        isShowingResult = false
    }
    
    mutating func changeResult(result: String) {
        self.result = result
    }
    
    // randomized the ai move and if player need to win or lose
    mutating func nextRound() {
        isPlayerNeedToWin = Bool.random()
        aiCurrentMove = Int.random(in: 0...2)
        
        numberOfRound += 1
        
        // 10 rounds per game
        if (numberOfRound == 10) {
            numberOfRound -= 1
            isShowingEndGame = true
        }
    }
    
    mutating func moveTapped(_ moveIndex: Int) {
        // user need to choose the move that either win or lose as per instruction to win the game
        // moveIndex is the index from winningMoveArray
        if ((isPlayerNeedToWin && aiCurrentMove == moveIndex) || (!isPlayerNeedToWin && aiCurrentMove != moveIndex)) {
            score += 1
            result = "You got it !!"
        } else {
            result = "Oops not corret ! The correct choice should be \(isPlayerNeedToWin ? winningMoveArray[aiCurrentMove] : losingMoveArray[aiCurrentMove])"
        }
        
        isShowingResult = true
    }
}
