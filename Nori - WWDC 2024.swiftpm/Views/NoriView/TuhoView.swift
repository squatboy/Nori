import SwiftUI

struct TuhoView: View {
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
            
            textView
        }
    }
    
    var rightView: some View {
        ZStack {
            VStack {
                if !isButtonClicked {
                    Text("Click the button to watch AR simulation of Tuho")
                        .font(.largeTitle)
                        .padding()
                    Button {
                        isButtonClicked = true
                        print("Button Clicked - \(isButtonClicked)")
                    } label: {
                        Text("Show up AR View")
                    }
                    .padding(30)
                    .bold()
                    .font(.title)
                    .frame(height: 80)
                    .foregroundColor(.black)
                    .background(.orange)
                    .cornerRadius(15)
                    .shadow(color: .orange, radius: 15, y: 5)
                }
                
                if isButtonClicked {
                    TuhoARView()
                        .edgesIgnoringSafeArea(.all)
                }
            }
        }
    }
    
    var pageHeader: some View {
        VStack{
            Image("Tuho")
                .resizable()
                .scaledToFit()
                .frame(width: 120)
                .padding(.top, 20)
            
            Text("Nori")
                .font(.caption)
                .foregroundColor(.secondary)
            
            Text("Tuho")
                .font(.title2).fontWeight(.semibold)
            
        }
        //        .padding(.top)
    }
    
    var textView: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text("Tuho is a traditional Korean board game that has been enjoyed for centuries. It is a strategic and entertaining game that is often played during festive occasions, family gatherings, and holidays.")
                
                horizontalDivider()
                
                Text("Game Components")
                    .gameDescriptionTitle()
                
                Text("The game is played with four wooden sticks, known as 'yut' which are tossed to determine the number of moves a player can make. Each yut stick has two flat sides and two rounded sides, with the flat sides representing 1 point and the rounded sides representing 0 points.")
                
                horizontalDivider()
                
                Text("Setup")
                    .gameDescriptionTitle()
                
                Text("Tuho is typically played on a square board divided into 29 spaces. The spaces are arranged in a specific pattern, and each player has four game pieces, usually small sticks or tokens.")
                
                horizontalDivider()
                
                Text("Objective")
                    .gameDescriptionTitle()
                
                Text("The goal of Tuho is to move all of your pieces around the board, following a specific path, and eventually reach the center space called 'Bang'")
                
                horizontalDivider()
                
                Text("Gameplay")
                    .gameDescriptionTitle()
                
                Text("Players take turns tossing the four yut sticks onto the board. The combination of flat and rounded sides facing up determines the number of moves the player can make. There are four possible outcomes: Do(도), Gae(개), Geol(걸), and Yut(윷). The player advances their game piece according to the result.")
                
                Text("There is also a combination called 'Mo' (모), which is the highest throw, allowing the player to move five spaces. However, rolling all flat or all rounded sides results in 'Back Do' (빽도), where the player moves backward one space.")
                
            }
            .padding(25)
            
            Toggle("Got it!", isOn: $isToggleOn)
                .bold()
                .frame(width: 200)
                .padding()
                .background(isToggleOn ? Color.green : Color.brown)
                .cornerRadius(15)
                .padding()
        }
    }
    
}





#Preview {
    TuhoView()
}
