//
//  GamePlayView.swift
//  RockPaperScissors
//
//  Created by vsay on 1/6/23.
//

import SwiftUI

let backgroundGradient = LinearGradient(
    colors: [Color.blue, Color.red],
    startPoint: .top, endPoint: .bottom)

struct GamePlayView: View {
    // use @State so the member variables inside GameData() can be used as binding variable
    @State var gameData = GameData()
    
    var body: some View {
        ZStack {
            backgroundGradient
            
            VStack {
                Text("Rock Papaer Scissors")
                    .titleStyle()
                
                VStack() {
                    Text("AI chose \(gameData.moveArray[gameData.aiCurrentMove])")
                        .titleWhiteWithBackgroundStyle()
                    
                    Text(gameData.isPlayerNeedToWin ? "What is your move to win this around?" : "What is your move to lose this around?")
                        .bodyStyle()
                    
                    VStack {
                        Text("Player")
                            .subTitleStyle()
                        
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
                    
                    HStack {
                        Text("Round: \(gameData.numberOfRound + 1)")
                            .bodyStyle()
                        Text("Score: \(gameData.score)")
                            .bodyStyle()
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))

            }
            .padding()
        }
        .ignoresSafeArea()
        
        // dialog to show result for each around
        .alert(gameData.result, isPresented: $gameData.isShowingResult) {
            Button("Continue") {
                gameData.nextRound()
            }
        } message: {
            Text("Your score is \(gameData.score)")
        }
        
        // dialog to show end of the game
        .alert("Game Ended", isPresented: $gameData.isShowingEndGame) {
            Button("Restart") {
                gameData.reset()
            }
        } message: {
            Text("You final score is \(gameData.score)")
        }
    }
}

struct GamePlayView_Previews: PreviewProvider {
    static var previews: some View {
        GamePlayView()
    }
}
