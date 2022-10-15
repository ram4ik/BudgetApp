//
//  CoreDataManager.swift
//  BudgetApp
//
//  Created by Ramill Ibragimov on 15.10.2022.
//

import Foundation
import CoreData

class CoreDataManager {
    
    static let shared = CoreDataManager()
    
    let persistentContainer: NSPersistentContainer
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "BudgetModel")
        persistentContainer.loadPersistentStores { description, error in
            if let error {
                fatalError("Unable to load Core Data Model \(error)")
            }
        }
    }
}
