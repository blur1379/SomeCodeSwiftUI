//
//  TimerBootcamp.swift
//  SomeCodeSwiftUI
//
//  Created by Mohammad Blur on 6/6/24.
//

import SwiftUI

struct TimerBootcamp: View {
    
    @State var timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    
    @State var currentDate = Date()
    var dateFormatter : DateFormatter {
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        return formatter
    }
    
    var body: some View {
        ZStack {
            RadialGradient(
                gradient: Gradient(colors: [Color.purple, Color.pink]),
                center: .center,
                startRadius: 5,
                endRadius: 500
            )
            .ignoresSafeArea()
            
            Text(dateFormatter.string(from: currentDate))
                .font(.system(size: 100, weight: .semibold, design: .rounded))
                .foregroundColor(.white)
                .lineLimit(1)
                .minimumScaleFactor(0.1)
            
        }
        .onReceive(timer, perform: { value in
            currentDate = value
        })
    }
}

#Preview {
    TimerBootcamp()
}
