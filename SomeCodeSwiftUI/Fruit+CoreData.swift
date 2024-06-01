//
//  Fruit+CoreData.swift
//  SomeCodeSwiftUI
//
//  Created by Mohammad Blur on 6/1/24.
//

import SwiftUI
import CoreData

class CoreDataViewModel: ObservableObject {
    
    let container: NSPersistentContainer
    @Published var savedEntity: [FruitEntity] = []
    init() {
        container = NSPersistentContainer(name: "FruitContainer")
        container.loadPersistentStores { success, error in
            if let error {
                print("error for persistent stores")
            } else {
                print("Successfully loaded core data")
            }
        }
        fetchRequest()
    }
    
    func fetchRequest() {
        let request = NSFetchRequest<FruitEntity>(entityName: "FruitEntity")
        
        do {
            savedEntity = try container.viewContext.fetch(request)
        } catch let error {
            print("Error for fetching the request")
        }
    }
    
    func addFruit(text: String) {
        let newFruit = FruitEntity(context: container.viewContext)
        newFruit.name = text
    }
    
    func saveData() {
        do {
            try container.viewContext.save()
            fetchRequest()
        } catch let error {
            print("error for fetching the data: \(error)")
        }
    }
}

struct FruitCoreData: View {
    
    @StateObject var vm = CoreDataViewModel()
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    FruitCoreData()
}
