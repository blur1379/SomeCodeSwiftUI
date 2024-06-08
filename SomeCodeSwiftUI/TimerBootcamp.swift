//
//  TimerBootcamp.swift
//  SomeCodeSwiftUI
//
//  Created by Mohammad Blur on 6/6/24.
//

import SwiftUI

struct TimerBootcamp: View {
    
    @State var timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    /*
    @State var currentDate = Date()
    var dateFormatter : DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        return formatter
    }
    */
    
    @State var count: Int = 10
    @State var finishedText: String? = nil
    var body: some View {
        ZStack {
            RadialGradient(
                gradient: Gradient(colors: [Color.purple, Color.pink]),
                center: .center,
                startRadius: 5,
                endRadius: 500
            )
            .ignoresSafeArea()
            
            Text(finishedText ?? "\(count)")
                .font(.system(size: 100, weight: .semibold, design: .rounded))
                .foregroundColor(.white)
                .lineLimit(1)
                .minimumScaleFactor(0.1)
            
        }
        .onReceive(timer, perform: { _ in
            if count < 1 {
                finishedText = "WOW!"
            } else {
                count -= 1
            }
        })
    }
}

#Preview {
    TimerBootcamp()
}
