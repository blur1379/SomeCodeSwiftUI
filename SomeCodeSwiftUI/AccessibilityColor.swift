//
//  AccessibilityColor.swift
//  SomeCodeSwiftUI
//
//  Created by Mohammad Blur on 6/12/24.
//

import SwiftUI

struct AccessibilityColor: View {
    @Environment(\.accessibilityReduceTransparency) var reduceTransparency
    @Environment(\.colorSchemeContrast) var colorSchemeContrast
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    @Environment(\.accessibilityInvertColors) var invertColors
    var body: some View {
        NavigationStack {
            VStack {
                Button("Button hi") {
                    
                }
                .foregroundStyle(colorSchemeContrast == .increased ? .white : .primary)
                .buttonStyle(.borderedProminent)
                
                Button("Button hi") {
                    
                }
                .foregroundStyle(.primary)
                .buttonStyle(.borderedProminent)
                .tint(.orange)
                
                Button("Button hi") {
                    
                }
                .foregroundStyle(.white)
                .buttonStyle(.borderedProminent)
                .tint(.green)
                
                Button("Button hi") {
                    
                }
                .foregroundStyle(differentiateWithoutColor ? .white : .green)
                .buttonStyle(.borderedProminent)
                .tint(differentiateWithoutColor ? .black : .purple)
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            .background(reduceTransparency ? Color.black : Color.black.opacity(0.5))
          
        }
    }
}

#Preview {
    AccessibilityColor()
}
