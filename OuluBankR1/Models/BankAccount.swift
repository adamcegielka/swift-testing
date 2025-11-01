//
//  BankAccount.swift
//  OuluBankR1
//
//  Created by Mohammad Azam on 2/13/25.
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
        self.balance += amount
    }
}
