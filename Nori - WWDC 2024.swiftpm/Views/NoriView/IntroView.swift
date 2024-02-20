//
//  SwiftUIView.swift
//
//
//  Created by 이재영 on 1/26/24.
//

import SwiftUI

struct IntroView: View {
    @State var isButtonClicked = false
    @State private var isToggleOn = UserDefaults.standard.bool(forKey: "isToggleOn")
    
    
    var body: some View {
        splitView
            .onDisappear {
                            UserDefaults.standard.set(self.isToggleOn, forKey: "isToggleOn")
                        }
            .onAppear {
                            self.isToggleOn = UserDefaults.standard.bool(forKey: "isToggleOn")
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
            Spacer()
            VStack(alignment: .center){
                Text("On this view, each course features a simple quiz about the corresponding folk game, allowing you to gauge your understanding.")
                    .opacity(0.7)
                    .padding(20)
                    .bold()
                    .font(.system(size: 35))
            }
            .frame(height: 500)
            .padding(10)
            .background(Color(uiColor: .secondarySystemBackground))
            .cornerRadius(10)
            
            Spacer()
            
            Toggle("Got It !", isOn: $isToggleOn)
                .toggleStyle(VerticalToggleStyle())
            
            Text("Toggle On if you completed the course")
                .padding(.top, 10)
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            Spacer()
        }
        .padding(.horizontal, 25)
    }
    
    var pageHeader: some View {
        VStack{
            Image("IntroIcon")
                .resizable()
                .scaledToFit()
                .frame(width: 100)
                .padding(.top, 20)
            
            Text("Nori")
                .padding(.top, 6)
                .font(.caption)
                .foregroundColor(.secondary)
            
            Text("What Is Nori")
                .font(.title2).fontWeight(.semibold)
            
        }
        //        .padding(.top)
    }
    
    var textView: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 23) {
                Text("Nori").bold().foregroundColor(.brown).font(.title) + Text(" is an app that introduces various Korean traditional folk games, allowing users to learn their gameplay and rules.")
                    .font(.title2)
                
                Text("To provide a more immersive experience, Nori utilizes Augmented Reality to showcase preview models of the games in AR View.")
                    .font(.title2)
                
                Text("Additionally, users can test their understanding through simple quizzes about the introduced folk games.")
                    .font(.title2)
                
            }
            .padding(.horizontal, 25)
            .padding(.top, 10)
            
            horizontalDivider()
        }
    }
}

#Preview {
    IntroView()
}
