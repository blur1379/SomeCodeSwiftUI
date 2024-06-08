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
    
//    @State var count: Int = 10
//    @State var finishedText: String? = nil
    
//    @State var timeRemaining: String = ""
//    let futureDate: Date = Calendar.current.date(byAdding: .day, value: 1, to: Date()) ?? Date()
//    
//    func updateTimeRemaining() {
//        let remaining = Calendar.current.dateComponents([.hour, .minute, .second], from: Date(), to: futureDate)
//        let hour = remaining.hour ?? 0
//        let minute = remaining.minute ?? 0
//        let second = remaining.second ?? 0
//        timeRemaining = "\(hour):\(minute):\(second)"
//    }
    
    //loading animation
    @State var count: Int = 0
    
    var body: some View {
        ZStack {
            RadialGradient(
                gradient: Gradient(colors: [Color.purple, Color.pink]),
                center: .center,
                startRadius: 5,
                endRadius: 500
            )
            .ignoresSafeArea()
            
            HStack(spacing: 15) {
                Circle()
                    .offset(y: count == 1 ? -20 : 0 )
                Circle()
                    .offset(y: count == 2 ? -20 : 0 )
                Circle()
                    .offset(y: count == 3 ? -20 : 0 )
            }
            .frame(width: 200)
            .foregroundColor(.white)
            
        }
        .onReceive(timer, perform: { _ in
            withAnimation(.easeInOut(duration: 1.0)) {
                count = count == 3 ? 0 : count + 1
            }
        })
    }
}

#Preview {
    TimerBootcamp()
}
