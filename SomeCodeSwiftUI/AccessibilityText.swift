//
//  AccessibilityText.swift
//  SomeCodeSwiftUI
//
//  Created by Mohammad Blur on 6/12/24.
//

import SwiftUI

struct AccessibilityText: View {
    @Environment(\.sizeCategory) var sizeCategory
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(1..<10) {item in
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Image(systemName: "heart.fill")
                                .font(.system(size: 20))
                            
                            Text("Welcome to my app")
                                .truncationMode(.tail)
                        }
                        .font(.title)
                        
                        Text("This text is some longer than before for test the main of this accessibility ")
                            .font(.subheadline)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .lineLimit(3)
                            .minimumScaleFactor(sizeCategory.customMinScaleFactor)
                    }
                }
            }
            .navigationTitle("Accessibility")
        }
    }
}

extension ContentSizeCategory {
    var customMinScaleFactor: CGFloat {
        switch self {
        case .extraSmall, .small, .medium:
            return 1.0
            
        case .large, .extraLarge, .extraExtraLarge:
            return 0.8
            
        default:
            return 0.9
        }
    }
}

#Preview {
    AccessibilityText()
}
