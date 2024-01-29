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
            
            Divider()
                .padding()
            
            rightView
                .frame(maxWidth: .infinity)
        }
    }
    
    var leftView: some View {
        VStack {
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
        //        VStack {
        //            Text("Click the button to watch AR simulation of Yutnori")
        //                .font(.largeTitle)
        //                .padding()
        //            Button {
        //                isButtonClicked = true
        //                print("Button Clicked - \(isButtonClicked)")
        //            } label: {
        //                Text("click me")
        //            }
        //            .frame(width: 100)
        //
        //            IntroView()
        //        }
        YutnoriARView()
    }
}


#Preview {
    YutnoriView()
}
