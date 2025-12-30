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
    
    
    
    var body: some View {
        

          
            
            ZStack{
                /*LinearGradient(colors: [.blue, .brown] , startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
          */
                
                Section(){
                    VStack(spacing: 50){
                        
                        Spacer()
                        
                        Text("Score: \(score)")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                        
                        Spacer()
                        
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
                        
                        Spacer()
                        
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
                        
                        
                        
                        HStack (spacing: 20){
                            Button(action: winOrLoose ? rocking : notRocking) {
                                Text("🪨")
                                    .font(.largeTitle)
                                    .padding()
                                    .background(.ultraThinMaterial)
                                    .clipShape(.circle)
                            }
                            
                            Button(action: winOrLoose ? papering : notPapering) {
                                Text("📄")
                                    .font(.largeTitle)
                                    .padding()
                                    .background(.ultraThinMaterial)
                                    .clipShape(.circle)
                            }
                            
                            Button(action: winOrLoose ? scissoring : notScissoring) {
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
            
                
                .alert(endOfGameTitle, isPresented: $endOfGame) {
                    Button("New Game", action: restartGame)
                } message: {
                    Text("You ve managed a score of \(score)")
                }
            
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.black.gradient)
   
    }
    
    
    func rocking() {
        
        if startValue == 2 {
            score += 1
            startValue = Int.random(in: 0...2)
            winOrLoose.toggle()
        } else {
            score -= 1
            startValue = Int.random(in: 0...2)
            winOrLoose.toggle()
        }
        
        maxQuestions += 1
        
        if maxQuestions == 5 {
            endOfGame = true
        }
    }
    
    func notRocking() {
      if startValue == 1 {
            score += 1
            startValue = Int.random(in: 0...2)
            winOrLoose.toggle()
        } else {
            score -= 1
            startValue = Int.random(in: 0...2)
            winOrLoose.toggle()
        }
        
        maxQuestions += 1
        
        if maxQuestions == 5 {
            endOfGame = true
        }

    }
    
    func papering() {
       if startValue == 0 {
            score += 1
            startValue = Int.random(in: 0...2)
            winOrLoose.toggle()
        } else {
            score -= 1
            startValue = Int.random(in: 0...2)
            winOrLoose.toggle()
        }
        
        maxQuestions += 1
        
        if maxQuestions == 5 {
            endOfGame = true
        }

    }
    
    func notPapering() {
        if startValue == 2 {
            score += 1
            startValue = Int.random(in: 0...2)
            winOrLoose.toggle()
        } else {
            score -= 1
            startValue = Int.random(in: 0...2)
            winOrLoose.toggle()
        }
        
        maxQuestions += 1
        
        if maxQuestions == 5 {
            endOfGame = true
        }

    }
    
    
    func scissoring() {
        if startValue == 1 {
            score += 1
            startValue = Int.random(in: 0...2)
            winOrLoose.toggle()
        } else {
            score -= 1
            startValue = Int.random(in: 0...2)
            winOrLoose.toggle()
        }
        
        maxQuestions += 1
        
        if maxQuestions == 5 {
            endOfGame = true
        }

    }
    
    func notScissoring() {
        if startValue == 0 {
            score += 1
            startValue = Int.random(in: 0...2)
            winOrLoose.toggle()
        } else {
            score -= 1
            startValue = Int.random(in: 0...2)
            winOrLoose.toggle()
        }
        maxQuestions += 1
        
        if maxQuestions == 5 {
            endOfGame = true
        }

    }
    
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
