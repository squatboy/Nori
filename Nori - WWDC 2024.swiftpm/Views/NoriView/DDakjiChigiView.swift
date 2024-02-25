//
//  SwiftUIView 2.swift
//
//
//  Created by 이재영 on 1/26/24.
//

import SwiftUI

struct DDakjiChigiView: View {
    @State var isButtonClicked = false
    @State private var isDDakjiChigiToggleOn = UserDefaults.standard.bool(forKey: "isDDakjiChigiToggleOn")
    
    var body: some View {
        splitView
            .onDisappear {
                UserDefaults.standard.set(self.isDDakjiChigiToggleOn, forKey: "isDDakjiChigiToggleOn")
            }
            .onAppear {
                self.isDDakjiChigiToggleOn = UserDefaults.standard.bool(forKey: "isDDakjiChigiToggleOn")
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
                title: "DDakjiChigi Quiz",
                question: "What do you mainly use to hold and hit Dakchijigi?",
                options: ["Feet", "Stick", "Hands", "Tongs"],
                correctAnswerIndex: 2)
            .transition(.slide)
            
            Spacer()
            
            NavigationLink(destination: DDakjiChigiARView()) {
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
            
            Toggle("Got It !", isOn: $isDDakjiChigiToggleOn)
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
            Image("DDakjiChigi")
                .resizable()
                .scaledToFit()
                .frame(width: 120)
                .padding(.top, 20)
            
            Text("Nori")
                .font(.caption)
                .foregroundColor(.secondary)
            
            Text("DDakjiChigi")
                .font(.title2).fontWeight(.semibold)
            
        }
        //        .padding(.top)
    }
    
    var textView: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text("DDakjiChigi").bold().foregroundColor(.brown).font(.title2) + Text(" has been enjoyed by children for generations, providing entertainment, skill development, and cultural connection. It is often played during festive occasions and leisure time.")
                
                horizontalDivider()
                
                
                Text("Game Components")
                    .gameDescriptionTitle()
                
                VStack(alignment: .leading, spacing: 23) {
                    Text("● DDakji").bold() + Text(": Ddakji are small, rectangular paper tiles, often decorated with colorful designs or patterns. These tiles are typically thicker and sturdier than regular paper, allowing them to withstand the impact of flipping.")
                    
                    Text("● Striking Tool").bold() + Text(": Players usually use their own hand to strike their ddakji and flip opponents' tiles and in some case, they use a small handheld tool, such as a wooden paddle or their own hand.")
                }
                .padding(5)
                VStack(spacing: 0) {
                    Image("DDakjiImage")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 280)
                        .padding()
                    
                    Text("< Image of DDakji >")
                        .foregroundColor(.secondary)
                }
                
                
                horizontalDivider()
                
                
                Text("Objective")
                    .gameDescriptionTitle()
                
                Text("The goal of DDakjiChigi is to strategically flip opponents' ddakji while protecting one's own. Players aim to use their skill and strategy to overturn as many opponent's ddakji as possible, ultimately claiming victory")
                
                
                horizontalDivider()
                
                
                Text("Gameplay")
                    .gameDescriptionTitle()
                
                VStack(alignment: .leading, spacing: 23) {
                    
                    Text("Players take turns standing around the playing area, each selecting a DDakji to flip. players strike their selected ddakji with precision, aiming to flip it over and potentially land on top of opponents' ddakji.")
                    
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
                            Text("The number of DDakji is determined with the opponent, but the game is usually played with 3 or 4 DDakji.")
                                .padding(.top, 2)
                        }
                        .padding(5)
                    }
                    .padding(10)
                    .background(Color(uiColor: .secondarySystemBackground))
                    .cornerRadius(10)
                    
                    Text("Successful flips result in the player claiming the overturned ddakji as their own. The game continues with each player taking turns until all ddakji have been flipped or until a predetermined number of rounds have been played.")
                    
                    Text("The player with the most flipped ddakji at the end of the game is declared the winner.")
                }
                .padding(5)
                
            }
            .padding(.horizontal, 25)
            .padding(.top, 10)
            
        }
    }
    
}




#Preview {
    DDakjiChigiView()
}
