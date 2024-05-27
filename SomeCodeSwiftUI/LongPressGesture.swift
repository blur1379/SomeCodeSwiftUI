//
//  LongPressGesture.swift
//  SomeCodeSwiftUI
//
//  Created by Mohammad Blur on 5/27/24.
//

import SwiftUI

struct LongPressGesture: View {
    
    @State var isCompleted: Bool = false
    @State var isSuccess: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                    .fill(isSuccess ? Color.green : Color.red)
                    .frame(maxWidth: isCompleted ? .infinity : 100)
                    .frame(height: 60)
                    .padding()
                    .onLongPressGesture(minimumDuration: 3.0, maximumDistance: 30) {
                        withAnimation {
                            isSuccess = true
                        }
                    } onPressingChanged: { isPressing in
                        if isPressing {
                            withAnimation(.easeInOut(duration: 3.0)) {
                                isCompleted = true
                            }
                        } else {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                if !isSuccess {
                                    withAnimation(.easeInOut) {
                                        isCompleted = false
                                    }
                                }
                            }
                        }
                    }

            }
            .frame(maxWidth: .infinity)
            .overlay(alignment: .center) {
                Text(isSuccess ? "لغو شد" : "لغو")
                    .foregroundStyle(.white)
                    .fontWeight(.bold)
            }
        }
    }
}

#Preview {
    LongPressGesture()
}
