//
//  CodableBootcamp.swift
//  SomeCodeSwiftUI
//
//  Created by Mohammad Blur on 6/4/24.
//

import SwiftUI

class CodableViewModel: ObservableObject {
    
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
