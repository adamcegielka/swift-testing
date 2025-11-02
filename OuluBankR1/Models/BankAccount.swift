//
//  BankAccount.swift
//  OuluBankR1
//
//  Created by Mohammad Azam on 2/13/25.
//  Updated by Adam on 11/1/2025.
//

import Foundation
        
enum BankAccountError: Error {
    case invalidAmount
}

enum DepositType {
    case check
    case cash
    case transfer
}

// create BankAccount class

class BankAccount {
    var accountNumber: String
    private(set) var balance: Double
    
    init(accountNumber: String, balance: Double) {
        self.accountNumber = accountNumber
        self.balance = balance
    }
    
    func deposit(amount: Double, depositType: DepositType) throws {
        
        let transferFeePercentage = 0.02 // 2%
        
        if amount < 0 {
            throw BankAccountError.invalidAmount
        }
        
        switch depositType {
            case .check, .cash:
                self.balance += amount
            case .transfer:
                let fee = amount * transferFeePercentage
                self.balance += (amount - fee)
        }
    }
}
