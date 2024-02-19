//
//  CongratsView.swift
//  Nori - WWDC 2024
//
//  Created by 이재영 on 2/18/24.
//

import SwiftUI

struct CongratsView: View {
    @State var isButtonClicked = false
    
    var body: some View {
        ZStack {
            VStack {
                if !isButtonClicked {
                    Text("Click the button to watch AR simulation of DDakjiChigi")
                        .font(.largeTitle)
                        .padding()
                    Button {
                        isButtonClicked = true
                        print("Button Clicked - \(isButtonClicked)")
                    } label: {
                        Text("Show up AR View")
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.accentColor.opacity(0.13))
                    .foregroundColor(.accentColor)
                    .font(.title2)
                    .bold()
                    .cornerRadius(10)
                    .padding(.horizontal, 40)
                    .padding(.vertical, 3)
                }
                
                if isButtonClicked {
                    DDakjiChigiARView()
                        .edgesIgnoringSafeArea(.all)
                }
            }
        }
    }
}

#Preview {
    CongratsView()
}
