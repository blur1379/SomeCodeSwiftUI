//
//  BackgroundThread.swift
//  SomeCodeSwiftUI
//
//  Created by Mohammad Blur on 6/2/24.
//

import SwiftUI

class BackgroundThreadViewModel: ObservableObject {
    @Published var dataArray: [String] = []
    
    
}

struct BackgroundThread: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    BackgroundThread()
}
