//
//  BackgroundThread.swift
//  SomeCodeSwiftUI
//
//  Created by Mohammad Blur on 6/2/24.
//

import SwiftUI

class BackgroundThreadViewModel: ObservableObject {
    @Published var dataArray: [String] = []
    
    func fetchData() {
        let newData = downloadData()
        dataArray = newData
    }
    
    func downloadData() -> [String] {
        var data: [String] = []
        
        for x in 1..<100 {
            data.append("\(x)")
        }
    return data
    }
}

struct BackgroundThread: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    BackgroundThread()
}
