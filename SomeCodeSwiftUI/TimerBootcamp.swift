//
//  TimerBootcamp.swift
//  SomeCodeSwiftUI
//
//  Created by Mohammad Blur on 6/6/24.
//

import SwiftUI

struct TimerBootcamp: View {
    var body: some View {
        ZStack {
            RadialGradient(
                gradient: Gradient(colors: [Color.purple, Color.pink]),
                center: .center,
                startRadius: 5,
                endRadius: 500
            )
            .ignoresSafeArea()
            
            
        }
    }
}

#Preview {
    TimerBootcamp()
}
