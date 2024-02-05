import SwiftUI

struct TuhoView: View {
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
            // Add your left view content here
        }
    }
    
    var rightView: some View {
        VStack {
            Text("Right View")
                .font(.largeTitle)
                .padding()
            // Add your right view content here
        }
    }
}



#Preview {
    TuhoView()
}
