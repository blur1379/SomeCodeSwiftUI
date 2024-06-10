//
//  FileManager.swift
//  SomeCodeSwiftUI
//
//  Created by Mohammad Blur on 6/8/24.
//

import SwiftUI


class LocalFileManager {
    static let instance = LocalFileManager()
    
    func saveImage(image: UIImage, name: String) {
        
        guard let data = image.jpegData(compressionQuality: 1.0) else { return }
        
        let dictionary = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let dictionary2 = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)
        let dictionary3 = FileManager.default.temporaryDirectory
    }
}

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

struct FileManagerB: View {
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
    FileManagerB()
}
