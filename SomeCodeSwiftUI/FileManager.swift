//
//  FileManager.swift
//  SomeCodeSwiftUI
//
//  Created by Mohammad Blur on 6/8/24.
//

import SwiftUI

class FileManagerViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    let imageName: String = "Steve-jobs"
    
    init() {
        getImageFromAssetsFolder()
    }
    
    func getImageFromAssetsFolder() {
        image = UIImage(named: imageName)
    }
}

struct FileManager: View {
    @StateObject var vm = FileManagerViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let image = vm.image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200,height: 200)
                        .clipped()
                        .cornerRadius(10)
                }
                
                Button(action: {
                    
                }, label: {
                    Text("Save to FM")
                        .foregroundColor(.white)
                        .font(.headline)
                        .padding()
                        .padding(.horizontal)
                        .background(Color.blue)
                        .cornerRadius(10)
                })
                Spacer()
            }
            .navigationTitle("File manager")
        }
    }
}

#Preview {
    FileManager()
}
