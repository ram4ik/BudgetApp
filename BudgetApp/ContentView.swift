//
//  ContentView.swift
//  BudgetApp
//
//  Created by Ramill Ibragimov on 15.10.2022.
//

import SwiftUI

// View is the View Model in SwiftUI
struct ContentView: View {
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\.name)]) private var budgetCategoryResults: FetchedResults<BudgetCategory>
    @State private var isPresented: Bool = false
    
    var body: some View {
        NavigationStack {
            List(budgetCategoryResults) { budgetCategory in
                HStack {
                    Text(budgetCategory.name ?? "")
                    Spacer()
                    Text(budgetCategory.amount as NSNumber, formatter: NumberFormatter.currency)
                }
                
            }.toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add New Category") {
                        isPresented = true
                    }
                }
            }.sheet(isPresented: $isPresented) {
                AddBudgetCategoryView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ContentView()
                .environment(\.managedObjectContext, CoreDataManager.shared.persistentContainer.viewContext)
        }
    }
}
