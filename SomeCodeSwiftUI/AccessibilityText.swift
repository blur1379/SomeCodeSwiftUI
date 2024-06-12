//
//  AccessibilityText.swift
//  SomeCodeSwiftUI
//
//  Created by Mohammad Blur on 6/12/24.
//

import SwiftUI

struct AccessibilityText: View {
    var body: some View {
        NavigationStack {
            List {
                ForEach(1..<10) {item in
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Image(systemName: "heart.fill")
                                .font(.system(size: 20))
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    AccessibilityText()
}
