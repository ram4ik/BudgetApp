//
//  String+Extensions.swift
//  BudgetApp
//
//  Created by Ramill Ibragimov on 15.10.2022.
//

import Foundation

extension String {
    
    var isNumeric: Bool {
        Double(self) != nil
    }
    
    func isGreatorThan(_ value: Double) -> Bool {
        
        guard self.isNumeric else {
            return false
        }
        
        return Double(self)! > value
    }
}
