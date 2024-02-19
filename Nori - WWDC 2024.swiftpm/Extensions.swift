//
//  Extensions.swift
//  Nori - WWDC 2024
//
//  Created by 이재영 on 2/10/24.
//

import Foundation
import SwiftUI

extension View {
    func gameDescriptionTitle() -> some View {
        self
            .bold()
            .font(.system(size: 17))
            .padding(.bottom, 8)
    }
}

struct VerticalToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        return VStack(alignment: .leading) {
            configuration.label // <1>
                .font(.system(size: 22, weight: .semibold)).lineLimit(2)
            HStack {
                if configuration.isOn { // <2>
                    Text("On")
                } else {
                    Text("Off")
                }
                Spacer()
                Toggle(configuration).labelsHidden() // <3>
            }
        }
        .frame(width: 100)
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(configuration.isOn ? Color.green: Color.gray, lineWidth: 2) // <4>
        )
    }
}
