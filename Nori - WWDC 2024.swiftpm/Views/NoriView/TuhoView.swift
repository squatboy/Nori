import SwiftUI

struct TuhoView: View {
    @State var isButtonClicked = false
    @State private var isTuhoToggleOn = UserDefaults.standard.bool(forKey: "isTuhoToggleOn")
    
    var body: some View {
        splitView
            .onDisappear {
                UserDefaults.standard.set(self.isTuhoToggleOn, forKey: "isTuhoToggleOn")
            }
            .onAppear {
                self.isTuhoToggleOn = UserDefaults.standard.bool(forKey: "isTuhoToggleOn")
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
                title: "Tuho Quiz",
                question: "Where should you aim the arrow when playing Tuho?",
                options: ["Close to the line", "Inside the barrel", "As far as possible", "To the sky"],
                correctAnswerIndex: 1)
            .transition(.slide)
            
            Spacer()
            
            NavigationLink(destination: TuhoARView()) {
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
            
            Toggle("Got It !", isOn: $isTuhoToggleOn)
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
                Text("Tuho").bold().foregroundColor(.brown).font(.title2) + Text(" is a traditional Korean board game that has been enjoyed for centuries. It is a game of accuracy and skill, in which players attempt to throw arrows into a narrow-necked wooden jar.")
                
                horizontalDivider()
                
                
                Text("Game Components")
                    .gameDescriptionTitle()
                VStack(alignment: .leading, spacing: 23){
                    Text("● Tuho Target").bold() + Text(": The central component of the game is a wooden cylindrical target, often adorned with intricate designs. The target features a small opening at the top, surrounded by concentric circles representing different point values.")
                    
                    Text("● Throwing Sticks").bold() + Text(": Players use elongated wooden sticks, resembling arrows, for tossing into the target. These sticks vary in length and thickness, adding complexity to the game.")
                }
                .padding(5)
                
                horizontalDivider()
                
                
                Text("Setup")
                    .gameDescriptionTitle()
                VStack(alignment: .leading, spacing: 23) {
                    Text("You place a target barrel on the floor and throw an arrow from an appropriate distance.")
                }
                .padding(5)
                
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
                
                VStack(alignment: .leading, spacing: 23) {
                    Text("Players take turns standing behind the throwing line and attempt to toss their sticks into the opening of the Tuho target.")
                    
                    Text("Tuho typically consists of multiple rounds, with players accumulating points over the course of the game. The player with the highest total score at the end of the game is declared the winner.")
                }
                .padding(5)
                
                horizontalDivider()
                
                Text("Cultural Significance")
                    .gameDescriptionTitle()
                
                VStack(alignment: .leading, spacing: 23){
                    Text("Tuho holds a special place in Korean culture, symbolizing unity, concentration, and friendly competition.")
                    
                    Text("Historically, Tuho was played during festive occasions, harvest celebrations, and communal gatherings, fostering camaraderie among participants.")
                }
                .padding(5)
                
            }
            .padding(.horizontal, 25)
            .padding(.top, 10)
        }
    }
    
}





#Preview {
    TuhoView()
}
