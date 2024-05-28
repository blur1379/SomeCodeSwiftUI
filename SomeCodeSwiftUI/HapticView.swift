//
//  HapticView.swift
//  SomeCodeSwiftUI
//
//  Created by Mohammad Blur on 5/28/24.
//

import SwiftUI

class HapticManager {
    static let instance = HapticManager()
    
    func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    
    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
}


struct HapticView: View {
    var body: some View {
        VStack {
            Button("success", action: { HapticManager.instance.notification(type: .success) })
            Button("warning", action: { HapticManager.instance.notification(type: .warning) })
            Button("error", action: { HapticManager.instance.notification(type: .error) })
            
            Divider()
            
            Button("soft", action: { HapticManager.instance.impact(style: .soft) })
            Button("light", action: { HapticManager.instance.impact(style: .light) })
            Button("medium", action: { HapticManager.instance.impact(style: .medium) })
            Button("rigid", action: { HapticManager.instance.impact(style: .rigid) })
            Button("heavy", action: { HapticManager.instance.impact(style: .heavy) })
            
            
        }.buttonStyle(BorderedButtonStyle())
    }
}

#Preview {
    HapticView()
}
