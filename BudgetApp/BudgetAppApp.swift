//
//  BudgetAppApp.swift
//  BudgetApp
//
//  Created by Ramill Ibragimov on 15.10.2022.
//

import SwiftUI

@main
struct BudgetAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, CoreDataManager.shared.persistentContainer.viewContext)
        }
    }
}
