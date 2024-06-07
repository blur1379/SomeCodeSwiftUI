//
//  CustomTabView.swift
//  SomeCodeSwiftUI
//
//  Created by Mohammad Blur on 6/7/24.
//

import SwiftUI

struct CustomTabView: View {
    
    @State private var activeTab: DummyTab = .home
    
    var body: some View {
        VStack(spacing: 16) {
            TabView(selection: $activeTab) {
                DummyTab.home.color
                    .tag(DummyTab.home)
                DummyTab.chart.color
                    .tag(DummyTab.chart)
                DummyTab.calls.color
                    .tag(DummyTab.calls)
                DummyTab.setting.color
                    .tag(DummyTab.setting)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
        }
    }
}

class pageOffsetObserver: NSObject, ObservableObject {
    @Published var collectionView: UICollectionView?
    @Published var offset: CGFloat = 0
    @Published private(set) var isObserving: Bool = false
    
    func observe() {
        
    }
    
    func remove() {
        
    }
    
}

struct FindCollectionView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        view.backgroundColor = .clear
        
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}

#Preview {
    CustomTabView()
}


enum DummyTab: String, CaseIterable {
    case home = "Home"
    case chart = "Chart"
    case calls = "Calls"
    case setting = "Setting"
    
    var color: Color {
        switch self {
        case .home:
            return .red
        case .chart:
            return .blue
        case .calls:
            return .green
        case .setting:
            return .yellow
        }
    }
    
}
