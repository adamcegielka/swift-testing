//
//  BankAccount.swift
//  OuluBankR1
//
//  Created by Mohammad Azam on 2/13/25.
//  Updated by Adam on 11/1/2025.
//

import Foundation
        
// create BankAccount class

enum DepositType {
    case check
    case cash
    case transfer
}

class BankAccount {
    var accountNumber: String
    private(set) var balance: Double
    
    init(accountNumber: String, balance: Double) {
        self.accountNumber = accountNumber
        self.balance = balance
    }
    
    func deposit(amount: Double, depositType: DepositType) {
        
        let transferFeePercentage = 0.02 // 2%
        
        switch depositType {
            case .check, .cash:
                self.balance += amount
            case .transfer:
                let fee = amount * transferFeePercentage
                self.balance += (amount - fee)
        }
    }
}
