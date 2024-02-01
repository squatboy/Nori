//
//  SwiftUIView.swift
//
//
//  Created by 이재영 on 1/26/24.
//

import SwiftUI

struct YutnoriView: View {
    @State var isButtonClicked = false
    @State var isToggleOn = false
    
    var body: some View {
        splitView
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
            
            Spacer()
            
            Text("Left View")
                .font(.largeTitle)
                .padding()
            
            Toggle("Got it!", isOn: $isToggleOn)
                .frame(width: 150)
                .padding(25)
                .background(.orange)
                .cornerRadius(15)
                .padding()
        }
    }
    
    var rightView: some View {
        ZStack {
            VStack {
                if !isButtonClicked {
                    Text("Click the button to watch AR simulation of Yutnori")
                        .font(.largeTitle)
                        .padding()
                    Button {
                        isButtonClicked = true
                        print("Button Clicked - \(isButtonClicked)")
                    } label: {
                        Text("Show up AR View")
                    }
                    .padding()
                    .font(.title)
                    .foregroundColor(.black)
                    .background(.orange)
                    .cornerRadius(10)
                    .shadow(color: .orange, radius: 15, y: 5)
                }
                
                if isButtonClicked {
                    YutnoriARView()
                        .edgesIgnoringSafeArea(.all)
                }
            }
        }
    }
    
    var pageHeader: some View {
        VStack{
            Image("Yutnori")
                .resizable()
                .scaledToFit()
                .frame(width: 120)
                .padding(.top, 20)
            
            Text("Nori")
                .font(.caption)
                .foregroundColor(.secondary)
            
            Text("Yutnori")
                .font(.title2).fontWeight(.semibold)
            
        }
//        .padding(.top)
    }
}


#Preview {
    YutnoriView()
}
