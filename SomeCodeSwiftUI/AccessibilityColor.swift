//
//  AccessibilityColor.swift
//  SomeCodeSwiftUI
//
//  Created by Mohammad Blur on 6/12/24.
//

import SwiftUI

struct AccessibilityColor: View {
    @Environment(\.accessibilityReduceTransparency) var reduceTransparency
    var body: some View {
        NavigationStack {
            VStack {
                Button("Button hi") {
                    
                }
                .foregroundStyle(.primary)
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
                .foregroundStyle(.green)
                .buttonStyle(.borderedProminent)
                .tint(.purple)
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            .background(reduceTransparency ? Color.black : Color.black.opacity(0.5))
          
        }
    }
}

#Preview {
    AccessibilityColor()
}
