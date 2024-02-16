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
