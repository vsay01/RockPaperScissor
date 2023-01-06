//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by vsay on 1/5/23.
//

import SwiftUI

struct ContentView: View {
    @State var gameData = GameData()
    
    var body: some View {
        VStack {
            Text("Rock Papaer Scissors")
                .padding()
            
            Text("AI choose \(gameData.moveArray[gameData.aiCurrentMove])")
            Text(gameData.isPlayerNeedToWin ? "You need to win this around." : "You need to lose this around.")
            Text("Choose your move below")
            
            VStack {
                Text("Player")
                
                ForEach(0..<3) { index in
                    Button(action: {
                        gameData.moveTapped(index)
                    }) {
                        HStack {
                            Image(systemName: gameData.winningMoveImgArray[index])
                            Text(gameData.winningMoveArray[index])
                        }
                    }
                    .buttonStyle(CustomButton())
                }
            }
            .padding()
            
            HStack {
                Text("Round: \(gameData.numberOfRound + 1)")
                Text("Score: \(gameData.score)")
            }
        }
        .padding()
        
        .alert(gameData.result, isPresented: $gameData.isShowingResult) {
            Button("Continue") {
                gameData.nextRound()
            }
        } message: {
            Text("Your score is \(gameData.score)")
        }
        
        .alert("Game Ended", isPresented: $gameData.isShowingEndGame) {
            Button("Restart") {
                gameData.reset()
            }
        } message: {
            Text("You final score is \(gameData.score)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
