//
//  NumberFormatter+Extension.swift
//  BudgetApp
//
//  Created by Ramill Ibragimov on 15.10.2022.
//

import Foundation

extension NumberFormatter {
    
    static var currency: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }
}
