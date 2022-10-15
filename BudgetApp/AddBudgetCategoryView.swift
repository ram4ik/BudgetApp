//
//  AddBudgetCategoryView.swift
//  BudgetApp
//
//  Created by Ramill Ibragimov on 15.10.2022.
//

import SwiftUI

// View is the View Model in SwiftUI
struct AddBudgetCategoryView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) private var dismiss
    @State private var name: String = ""
    @State private var amount: String = ""
    
    var isFormValid: Bool {
        !name.isEmpty && !amount.isEmpty && amount.isNumeric && amount.isGreatorThan(0)
    }
    
    private func saveBudgetCategory() {
        let budgetCategory = BudgetCategory(context: viewContext)
        budgetCategory.name = name
        budgetCategory.amount = Double(amount)!
        
        do {
            try viewContext.save()
            dismiss()
        } catch {
            print(error)
        }
    }
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Title", text: $name)
                TextField("Amount", text: $amount)
                    .keyboardType(.decimalPad)

            }.toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        saveBudgetCategory()
                    }.disabled(!isFormValid)
                }
            }
        }
    }
}

struct AddBudgetCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AddBudgetCategoryView()
        }
    }
}
