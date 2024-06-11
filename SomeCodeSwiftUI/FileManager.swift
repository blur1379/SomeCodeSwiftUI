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
        
        guard let data = image.jpegData(compressionQuality: 1.0),
              let path = getPathForImage(name: name) else { return }
        
//        let dictionary = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
//        let dictionary2 = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)
//        let dictionary3 = FileManager.default.temporaryDirectory
        
    
        
        do {
            try data.write(to: path)
        } catch {
            print("Error for saving the information with : \(error)")
        }
    }
    
    func getImage(name: String) -> UIImage? {
        guard let path = getPathForImage(name: name)?.path,
              FileManager.default.fileExists(atPath: path) else {
            print("Error for get the image :( ")
            return nil
        }
        return UIImage(contentsOfFile: path)
    }
    
    func getPathForImage(name: String) -> URL?{
        guard let path = FileManager
                            .default
                            .urls(for: .cachesDirectory, in: .userDomainMask)
                            .first?
                            .appendingPathComponent("\(name).jpg") else
        { return nil }
        return path
    }
    
}

class FileManagerViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    let imageName: String = "Steve-jobs"
    let manager = LocalFileManager.instance
    
    init() {
        getImageFromAssetsFolder()
    }
    
    func getImageFromAssetsFolder() {
        image = UIImage(named: imageName)
    }
    
    func saveImage() {
        guard let image else {return}
        manager.saveImage(image: image, name: imageName)
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
                    vm.saveImage()
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
