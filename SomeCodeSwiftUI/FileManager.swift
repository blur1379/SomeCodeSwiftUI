//
//  FileManager.swift
//  SomeCodeSwiftUI
//
//  Created by Mohammad Blur on 6/8/24.
//

import SwiftUI


class LocalFileManager {
    static let instance = LocalFileManager()
    let folderName = "some_code_app"
    init() {
        createFolderIfNeeded()
    }
    
    func createFolderIfNeeded() {
        guard
            let path = FileManager
                .default
                .urls(for: .cachesDirectory, in: .userDomainMask)
                .first?
                .appendingPathComponent(folderName)
                .path else { return }
        
        if !FileManager.default.fileExists(atPath: path) {
            do {
                try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
            } catch {
                print("error for creating The Directory ")
            }
        }
    }
    
    func deleteFolder() {
        guard
            let path = FileManager
                .default
                .urls(for: .cachesDirectory, in: .userDomainMask)
                .first?
                .appendingPathComponent(folderName)
                .path else { return }
        
        do {
            try FileManager.default.removeItem(atPath: path)
        } catch {
            print("error for deleting folder: \(error)")
        }
    }
    
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
            print("Error for get the path :( ")
            return nil
        }
        return UIImage(contentsOfFile: path)
    }
    
    func deleteImage(name: String) {
        guard let path = getPathForImage(name: name)?.path,
              FileManager.default.fileExists(atPath: path) else {
            print("Error for get the path :( ")
            return
        }
        
        do {
            try FileManager.default.removeItem(atPath: path)
            print("Successfully deleted")
        } catch let error {
            print("deleted error with : \(error)")
        }
    }
    
    func getPathForImage(name: String) -> URL?{
        guard let path = FileManager
                            .default
                            .urls(for: .cachesDirectory, in: .userDomainMask)
                            .first?
                            .appendingPathComponent(folderName)
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
    
    func getImageFromFileManager() {
        image = manager.getImage(name: imageName)
    }
    
    func saveImage() {
        guard let image else {return}
        manager.saveImage(image: image, name: imageName)
    }
    
    func deleteImage() {
        manager.deleteImage(name: imageName)
        manager.deleteFolder()
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
                
                HStack {
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
                    
                    Button(action: {
                        vm.deleteImage()
                    }, label: {
                        Text("Delete from FM")
                            .foregroundColor(.white)
                            .font(.headline)
                            .padding()
                            .padding(.horizontal)
                            .background(Color.red)
                            .cornerRadius(10)
                    })
                }
                
            
                Spacer()
            }
            .navigationTitle("File manager")
        }
    }
}

#Preview {
    FileManagerB()
}
