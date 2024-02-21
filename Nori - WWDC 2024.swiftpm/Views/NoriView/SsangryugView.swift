//
//  NamseungdoGame.swift
//  Nori - WWDC 2024
//
//  Created by 이재영 on 2/14/24.
//

import SwiftUI

struct SsangryugView: View {
    @State var isButtonClicked = false
    @State private var isSsangryukToggleOn = UserDefaults.standard.bool(forKey: "isSsangryukToggleOn")
    
    var body: some View {
        splitView
            .onDisappear {
                UserDefaults.standard.set(self.isSsangryukToggleOn, forKey: "isSsangryukToggleOn")
            }
            .onAppear {
                self.isSsangryukToggleOn = UserDefaults.standard.bool(forKey: "isSsangryukToggleOn")
            }
    }
    
    // MARK: 뷰 두개로 나누기
    var splitView: some View {
        HStack(spacing: 0) {
            leftView
                .frame(maxWidth: .infinity)
            
            verticalDivider()
            
            rightView
                .frame(maxWidth: .infinity)
        }
        .ignoresSafeArea()
    }
    
    var leftView: some View {
        VStack {
            pageHeader
            
            horizontalDivider()
            
            textView
            
        }
    }
    
    var rightView: some View {
        VStack {
            QuizView(
                title: "Ssangryug Quiz",
                question: "What determines movement of the game piece?",
                options: ["London", "Paris", "Berlin", "Madrid"],
                correctAnswerIndex: 1)
            .transition(.slide)
            
            Spacer()
            
            NavigationLink(destination: YutnoriARView()) {
                Text("Show up AR View")
                    .padding(30)
                    .bold()
                    .font(.title3)
                    .frame(height: 60)
                    .foregroundColor(.black)
                    .background(.orange)
                    .cornerRadius(15)
                    .shadow(color: .orange, radius: 15, y: 5)
            }
            .padding(20)
            .padding(.bottom, 20)
            
            Spacer()
            
            Toggle("Got It !", isOn: $isSsangryukToggleOn)
                .toggleStyle(VerticalToggleStyle())
            
            Text("Toggle On if you completed the course")
                .padding(.top, 10)
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            Spacer()
        }
    }
    
    var pageHeader: some View {
        VStack{
            Image("Ssangryug")
                .resizable()
                .scaledToFit()
                .frame(width: 120)
                .padding(.top, 20)
            
            Text("Nori")
                .font(.caption)
                .foregroundColor(.secondary)
            
            Text("Ssangryug")
                .font(.title2).fontWeight(.semibold)
            
        }
        //        .padding(.top)
    }
    
    var textView: some View {
        ScrollView {
            VStack(spacing: 10) {
                    Text("Ssangryug").bold().foregroundColor(.brown).font(.title2) + Text(" is a Korean traditional dice game enjoyed by people of all ages. This game, deeply embedded in Korean culture, combines luck, strategy, and social interaction to provide hours of entertainment.")
                
                horizontalDivider()
                
                Text("Game Components")
                    .gameDescriptionTitle()
                VStack(alignment: .leading, spacing: 23) {
                    Text("● Dice").bold() + Text(": People usually play with the commonly used six-sided dice.")
                    
                    Text("● Ssangryuk board").bold() + Text(": On the game board, they track their points and record their rolls. The game board typically lists the various combinations and their corresponding point values.")
                    
                    HStack {
                        Rectangle()
                            .foregroundColor(.accentColor)
                            .frame(width: 5)
                            .cornerRadius(10)
                            .padding(1)
                        VStack(alignment: .leading){
                            Text("Addition")
                                .lineSpacing(3.5)
                                .font(.footnote)
                                .foregroundColor(.secondary)
                            Text("For the game pieces to mark their scores or keep track of their progress on the game board, people mainly use piece made of wood similar to a chess pawn.")
                                .font(.callout)
                                .padding(.top, 2)
                        }
                        .padding(5)
                    }
                    .padding(10)
                    .background(Color(uiColor: .secondarySystemBackground))
                    .cornerRadius(10)
                }
                .padding(5)
                
                horizontalDivider()
                
                Text("Setup")
                    .gameDescriptionTitle()
                
                VStack(spacing: 0) {
                    Image("SsangryukSetup")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 340)
                        .padding()
                    
                    Text("< Ssangryuk Board >")
                        .foregroundColor(.secondary)
                }
                
                
                horizontalDivider()
                
                Text("Objective")
                    .gameDescriptionTitle()
                
                Text("The primary objective of Ssangryuk is to accumulate points by rolling a set of six dice and achieving specific combinations. Players aim to strategically decide which combinations to pursue based on their current roll and the potential payoff.")
                
                horizontalDivider()
                
                Text("Gameplay")
                    .gameDescriptionTitle()
                
                VStack(alignment: .leading, spacing: 23) {
                    Text("Players take turns rolling the six dice and carefully examining the results to determine their score.")
                    
                    Text("The dice rolls yield different combinations, each with its own point value. Players must strategically choose which combinations to aim for based on their current score and game situation.")
                    
                    Text("Certain combinations, such as matching symbols or sequential numbers, result in higher point values and bonuses. Players aim to achieve these combinations while avoiding low-scoring rolls.")
                    
                    Text("The game continues for a predetermined number of rounds, with players taking turns rolling the dice and recording their scores on the score sheet.")
                }
                .padding(5)
                
                horizontalDivider()
                
            }
            .padding(.horizontal, 25)
            .padding(.top, 10)
        }
    }
    
}

#Preview {
    SsangryugView()
}
