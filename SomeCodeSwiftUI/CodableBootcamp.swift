//
//  CodableBootcamp.swift
//  SomeCodeSwiftUI
//
//  Created by Mohammad Blur on 6/4/24.
//

import SwiftUI

struct CustomModel: Codable, Identifiable {
    let id: String
    let name: String
    let points: Int
    let isPremium: Bool
}

class CodableViewModel: ObservableObject {
    
    @Published var customer: CustomModel? = nil
    
    init() {
        
    }
    
    func getData() {
        
    }
    
    func getJSONData() -> Data? {
        let dictionary: [String:Any] = [
            "id" : "12345",
            "name" : "Jon",
            "points" : 5,
            "isPremium" : true,
        ]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: dictionary, options: [])
        return jsonData
    }
}

struct CodableBootcamp: View {
    @StateObject var vm = CodableViewModel()
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    CodableBootcamp()
}
