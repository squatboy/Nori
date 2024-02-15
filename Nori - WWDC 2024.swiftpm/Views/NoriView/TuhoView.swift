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
                Text("Tuho").bold().foregroundColor(.brown) + Text(" is a traditional Korean board game that has been enjoyed for centuries. It is a game of accuracy and skill, in which players attempt to throw arrows into a narrow-necked wooden jar.")
                
                horizontalDivider()

                VStack(spacing: 23) {
                    Text("Game Components")
                        .gameDescriptionTitle()
                    
                    Text("- Tuho Target").bold() + Text(": The central component of the game is a wooden cylindrical target, often adorned with intricate designs. The target features a small opening at the top, surrounded by concentric circles representing different point values.")
                         
                    Text("- Throwing Sticks").bold() + Text(": Players use elongated wooden sticks, resembling arrows, for tossing into the target. These sticks vary in length and thickness, adding complexity to the game.")
                }
                
                horizontalDivider()
                
                Text("Setup")
                    .gameDescriptionTitle()
                
                Text("You place a target barrel on the floor and throw an arrow from an appropriate distance.")
                
                VStack(spacing: 0) {
                    Image("TuhoSetup")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 350)
                        .padding()
                    
                    Text("< Example of playing Tuho >")
                        .foregroundColor(.secondary)
                }
                
                horizontalDivider()
                
                Text("Gameplay")
                    .gameDescriptionTitle()
                
                Text("Players take turns standing behind the throwing line and attempt to toss their sticks into the opening of the Tuho target. Tuho typically consists of multiple rounds, with players accumulating points over the course of the game. The player with the highest total score at the end of the game is declared the winner.")
                
                horizontalDivider()
                
                Text("Cultural Significance")
                    .gameDescriptionTitle()
                
                Text("Tuho holds a special place in Korean culture, symbolizing unity, concentration, and friendly competition. Historically, Tuho was played during festive occasions, harvest celebrations, and communal gatherings, fostering camaraderie among participants.")
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
