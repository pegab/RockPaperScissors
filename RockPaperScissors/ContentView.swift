//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Peter Gabriel on 28.12.25.
//

import SwiftUI

struct ContentView: View {
    
    
    @State private var values = ["Rock", "Paper", "Scissors"]
    
    @State private var startValue = Int.random(in: 0...2)
    @State private var winOrLoose = Bool.random()
    @State private var score = 0
    
    @State private var endOfGame = false
    @State private var endOfGameTitle = "END OF GAME"
    @State private var maxQuestions: Int = 0
    
    //@State private var userChoise = 0
    
    
    
    var body: some View {
        
            ZStack{
                /*LinearGradient(colors: [.blue, .brown] , startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
          */
               
                    VStack(spacing: 50){
                        
                        Spacer()
                        
                        VStack{
                            if winOrLoose {
                                Text("Which one wins?")
                                    .padding()
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                    .foregroundStyle(.green)
                                
                            } else {
                                Text("Which one loses?")
                                    .padding()
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                    .foregroundStyle(.red)
                                
                            }
                            
                        }
                        
                        Spacer()
                        
                        VStack{
                            if values[startValue] == "Rock" {
                                Text("🪨")
                                    .font(.system(size: 150))
                                
                            } else if values[startValue] == "Paper" {
                                Text("📄")
                                    .font(.system(size: 150))
                            } else {
                                Text("✂️")
                                    .font(.system(size: 150))
                            }
                        }
                        
                        Spacer()
                        
                        VStack{
                            Spacer()
                            
                            Text("Score: \(score)")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                        }
                       
                        
                        HStack (spacing: 20){
                          
                            Button{ winLoseCalculator(userChoise: 0) }
                            label: {
                                Text("🪨")
                                    .font(.largeTitle)
                                    .padding()
                                    .background(.ultraThinMaterial)
                                    .clipShape(.circle)
                            }
                            
                            Button{ winLoseCalculator(userChoise: 1) }
                            label: {
                                Text("📄")
                                    .font(.largeTitle)
                                    .padding()
                                    .background(.ultraThinMaterial)
                                    .clipShape(.circle)
                            }
                            
                            Button{ winLoseCalculator(userChoise: 2) }
                            label: {
                                Text("✂️")
                                    .font(.largeTitle)
                                    .padding()
                                    .background(.ultraThinMaterial)
                                    .clipShape(.circle)
                            }
                            
                        }
                        
                        Spacer()
                        
                        
                    }
                    
            
            }
        //mittels zstack wird der hintergrund gestaltet...der zstack ist immer die unterste ebene
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.black.gradient)
        //der zstack ist auch der highest stable container und somit wird der viewmodifier .alert hier angehängt
            .alert(endOfGameTitle, isPresented: $endOfGame) {
                Button("New Game", action: restartGame)
            } message: {
                Text("You ve managed a score of \(score)")
            }
   
    }
    
    /*die funcs funktionieren wie folgt:
     
     die Userchoise wird hardcoded vom Button Press übermittelt
     switch vergleicht startvalue = cpuChoise mit unserChoise
     if winOrLoose == true dann werden die cases angeführt in denen der User
     gewinnt, zb: 0,1 CPU hat Rock User hat Papier somit gewinnt der User,
     usw.
     danach bekommt er einen Punkt, in allen anderen Fällen (default) verliert der User und ein Punkt wird abgezogen
     danach wird das Spiel für eine neue Runde zurückgesetzt und die Anzahl der maxFragen um 1 erhöht (nach 5 Fragen ist das Spiel beendet)
     sollte winOrLoose false sein wird der else Block ausgeführt der genau
     gegensätzlich funktioniert.
    
    */
    
    func winLoseCalculator(userChoise: Int) {
        if winOrLoose == true {
            switch (startValue, userChoise){
            case (0,1), (1,2), (2,0): score += 1
            default: score -= 1
            }
            startValue = Int.random(in: 0...2)
            winOrLoose.toggle()
            maxQuestions += 1
            
            if maxQuestions == 5 {
                endOfGame = true
            }
        } else {
            switch (startValue, userChoise) {
            case (0,2), (1,0), (2,1): score += 1
            default: score -= 1
            }
            startValue = Int.random(in: 0...2)
            winOrLoose.toggle()
            maxQuestions += 1
            
            if maxQuestions == 5 {
                endOfGame = true
            }
        }
    }
    //wird via .alert ausgeführt
    func restartGame() {
        score = 0
        maxQuestions = 0
        startValue = Int.random(in: 0...2)
        winOrLoose.toggle()
    }
   
}

#Preview {
    ContentView()
}
