import SwiftUI

struct QuizView: View {
    let question: String
    let options: [String]
    let correctAnswerIndex: Int
    @State private var selectedAnswerIndex: Int?
    @State private var isAnswerCorrect = false

    var body: some View {
        VStack {
            Text(question)
                .font(.title)
                .padding()

            ForEach(0..<options.count, id: \.self) { index in
                Button(action: {
                    self.selectedAnswerIndex = index
                    self.checkAnswer()
                }) {
                    Text(self.options[index])
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
                .disabled(self.selectedAnswerIndex != nil)
            }
            Spacer()
        }
    }

    func checkAnswer() {
        if selectedAnswerIndex == correctAnswerIndex {
            isAnswerCorrect = true
        }
    }
}
