//
//  Divider.swift
//  Nori - WWDC 2024
//
//  Created by 이재영 on 2/1/24.
//

import SwiftUI

struct horizontalDivider: View {
    var body: some View {
        Rectangle()
            .foregroundColor(Color(uiColor: UIColor.secondarySystemBackground))
            .frame(height: 2)
            .padding()
    }
}

struct verticalDivider: View {
    var body: some View {
        Rectangle()
            .foregroundColor(Color(uiColor: UIColor.secondarySystemBackground))
            .frame(width: 2)
            .cornerRadius(5)
            .padding(.top, 30).padding(.bottom, 20)
    }
}

#Preview {
    Divider()
}
