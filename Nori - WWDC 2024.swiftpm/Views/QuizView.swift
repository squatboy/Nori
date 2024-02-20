import SwiftUI

struct QuizView: View {
    let title: String
    let question: String
    let options: [String]
    let correctAnswerIndex: Int
    @State private var selectedAnswerIndex: Int?
    @State private var isAnswerCorrect = false
    
    var body: some View {
        VStack {
            VStack(alignment: .center){
                Text(title)
                    .foregroundColor(.gray)
                Text(question)
                    .opacity(0.7)
                    .padding(20)
                    .bold()
                    .font(.system(size: 24))
            }
            .frame(width: 340, height: 180)
            .padding(10)
            .background(Color(uiColor: .secondarySystemBackground))
            .cornerRadius(10)
            
            VStack {
                ForEach(0..<options.count / 2, id: \.self) { rowIndex in
                    HStack {
                        ForEach(0..<2, id: \.self) { colIndex in
                            let index = rowIndex * 2 + colIndex
                            if index < options.count {
                                Button(action: {
                                    self.selectedAnswerIndex = index
                                    self.checkAnswer()
                                }) {
                                    Text(self.options[index])
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 100)
                                        .background(self.backgroundColor(for: index))
                                        .foregroundColor(.accentColor)
                                        .font(.title2)
                                        .bold()
                                        .cornerRadius(10)
                                        .padding(4)
                                }
                            }
                        }
                    }
                }
            }
            .padding()
        }
        .padding(.top, 35)
    }
    
    func backgroundColor(for index: Int) -> Color {
        if let selectedAnswerIndex = selectedAnswerIndex {
            if selectedAnswerIndex == index {
                if isAnswerCorrect && selectedAnswerIndex == correctAnswerIndex {
                    return .green
                } else if !isAnswerCorrect && selectedAnswerIndex == correctAnswerIndex {
                    return .red
                } else if !isAnswerCorrect && selectedAnswerIndex != correctAnswerIndex {
                    return .red
                }
            }
        }
        return Color.accentColor.opacity(0.13)
    }
    
    func checkAnswer() {
        if let selectedAnswerIndex = selectedAnswerIndex {
            isAnswerCorrect = selectedAnswerIndex == correctAnswerIndex
        }
    }
    
    func resetQuiz() {
        selectedAnswerIndex = nil
        isAnswerCorrect = false
    }
}

#Preview {
    QuizView(
        title: "Quiz Title",
        question: "Example of Quiz",
        options: ["A", "B", "C", "D"],
        correctAnswerIndex: 1)
}
