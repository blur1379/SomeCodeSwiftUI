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
        DispatchQueue.global(qos: .background).async { [weak self] in
            let newData = self?.downloadData()
            DispatchQueue.main.async {
                self?.dataArray = newData ?? []
            }
        }
        
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
    
    @StateObject var vm = BackgroundThreadViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text("Load Data")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .onTapGesture {
                        vm.fetchData()
                    }
                
                ForEach(vm.dataArray, id: \.self) { item in
                    Text(item)
                        .font(.headline)
                        .foregroundColor(.red)
                }
            }
        }
    }
}

#Preview {
    BackgroundThread()
}
