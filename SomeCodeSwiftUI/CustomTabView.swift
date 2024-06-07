//
//  CustomTabView.swift
//  SomeCodeSwiftUI
//
//  Created by Mohammad Blur on 6/7/24.
//

import SwiftUI

struct CustomTabView: View {
    
    @State private var activeTab: DummyTab = .home
    @StateObject var offsetObserver = pageOffsetObserver()
    
    var body: some View {
        VStack(spacing: 16) {
            Tabbar(.gray)
                .overlay {
                    if let collectionViewBounds = offsetObserver.collectionView?.bounds {
                        GeometryReader {
                            let width = $0.size.width
                            let tabCount = CGFloat(DummyTab.allCases.count)
                            let capsuleWidth = width / tabCount
                            let progress = offsetObserver.offset / collectionViewBounds.width
                            
                            Capsule()
                                .fill(.black)
                                .frame(width: capsuleWidth)
                                .offset(x: progress * capsuleWidth)
                            
                            Tabbar(.white, .semibold)
                                .mask(alignment: .leading) {
                                    Capsule()
                                        .frame(width: capsuleWidth)
                                        .offset(x: progress * capsuleWidth)
                                }
                        }
                    }
                }
                .background(.ultraThinMaterial)
                .clipShape(.capsule)
                .shadow(color: .black.opacity(0.1), radius: 5, x: 5, y: 5)
                .shadow(color: .black.opacity(0.05), radius: 5, x: -5, y: -5)
                .padding(.horizontal)
            
            TabView(selection: $activeTab) {
                DummyTab.home.color
                    .tag(DummyTab.home)
                    .background{
                        if !offsetObserver.isObserving {
                            FindCollectionView() {
                                offsetObserver.collectionView = $0
                                offsetObserver.observe()
                            }
                        }
                    }
                DummyTab.chart.color
                    .tag(DummyTab.chart)
                DummyTab.calls.color
                    .tag(DummyTab.calls)
                DummyTab.setting.color
                    .tag(DummyTab.setting)
            }
            .animation(.spring, value: activeTab)
            .tabViewStyle(.page(indexDisplayMode: .never))
            
        }
    }
    
    @ViewBuilder
    func Tabbar(_ tint: Color, _ weight: Font.Weight = .regular) -> some View {
        HStack(spacing: 0) {
            ForEach(DummyTab.allCases, id: \.rawValue) { tab in
                    Text(tab.rawValue)
                        .font(.callout)
                        .fontWeight(weight)
                        .foregroundStyle(tint)
                        .padding(.vertical, 10)
                        .frame(maxWidth: .infinity)
                        .contentShape(.rect)
                        .onTapGesture {
                            activeTab = tab
                        }
            }
        }
    }
}

class pageOffsetObserver: NSObject, ObservableObject {
    @Published var collectionView: UICollectionView?
    @Published var offset: CGFloat = 0
    @Published private(set) var isObserving: Bool = false
    
    deinit {
        remove()
    }
    
    func observe() {
        guard !isObserving else { return }
        collectionView?.addObserver(self, forKeyPath: "contentOffset", context: nil)
        isObserving = true
    }
    
    func remove() {
        isObserving = false
        collectionView?.removeObserver(self, forKeyPath: "contentOffset")
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        guard keyPath == "contentOffset" else { return }
        if let contentOffset = (object as? UICollectionView)?.contentOffset {
            offset = contentOffset.x
        }
    }
    
}

struct FindCollectionView: UIViewRepresentable {
    
    var result: (UICollectionView) -> ()
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        view.backgroundColor = .clear
        
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            if let collectionSuperView = view.collectionSuperView {
                result(collectionSuperView)
            }
        }
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}

extension UIView {
    var collectionSuperView: UICollectionView? {
        if let collectionSuperView = superview as? UICollectionView {
            return collectionSuperView
        }
        return superview?.collectionSuperView
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
