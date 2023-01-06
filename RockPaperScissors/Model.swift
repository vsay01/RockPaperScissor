//
//  Model.swift
//  RockPaperScissors
//
//  Created by vsay on 1/6/23.
//

import Foundation

struct GameData{
    var moveArray = ["Rock", "Paper", "scissors"]
    var winningMoveImgArray = ["hand.raised.fill", "scissors", "circle.fill"]
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
    
    mutating func nextRound() {
        isPlayerNeedToWin = Bool.random()
        aiCurrentMove = Int.random(in: 0...2)
    }
    
    mutating func moveTapped(_ moveIndex: Int) {
        print(aiCurrentMove)
        print(moveIndex)
        if ((isPlayerNeedToWin && aiCurrentMove == moveIndex) || (!isPlayerNeedToWin && aiCurrentMove != moveIndex)) {
            score += 1
            result = "You got it !!"
        } else {
            result = "Oops not corret ! The correct choice should be \(isPlayerNeedToWin ? winningMoveArray[aiCurrentMove] : losingMoveArray[aiCurrentMove])"
        }
        numberOfRound += 1
        if (numberOfRound >= 3) {
            numberOfRound -= 1
            isShowingResult = false
            isShowingEndGame = true
        } else {
            isShowingResult = true
        }
    }
}
