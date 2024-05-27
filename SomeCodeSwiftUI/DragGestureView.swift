//
//  DragGestureView.swift
//  SomeCodeSwiftUI
//
//  Created by Mohammad Blur on 5/27/24.
//

import SwiftUI

struct DragGestureView: View {
    
    @State var offset: CGSize = .zero
    
    var body: some View {
        RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
            .frame(width: 100, height: 100)
            .offset(offset)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        offset = value.translation
                    }
                    .onEnded { value in
                        withAnimation(.spring) {
                            offset = .zero
                        }
                    }
            )
    }
}

#Preview {
    DragGestureView()
}
