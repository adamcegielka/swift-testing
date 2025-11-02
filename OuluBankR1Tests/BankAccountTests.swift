//
//  OuluBankR1Tests.swift
//  OuluBankR1Tests
//
//  Created by Mohammad Azam on 2/13/25.
//  Updated by Adam on 11/1/2025.
//

import Testing
@testable import OuluBankR1

struct BankAccountTests {

    // First tests
    @Test
    func deposit_amount_using_check_increases_balance() {
        // AREANGE
        let bankAccount = BankAccount(accountNumber: "123456", balance: 500)
        // ACT
        bankAccount.deposit(amount: 200, depositType: .check)
        // ASSERT
        #expect(bankAccount.balance == 700)
    }
    
    @Test
    func deposit_amount_using_cash_increases_balance() {
        // AREANGE
        let bankAccount = BankAccount(accountNumber: "123456", balance: 500)
        // ACT
        bankAccount.deposit(amount: 200, depositType: .cash)
        // ASSERT
        #expect(bankAccount.balance == 700)
    }
    
    // Improved test
    // Refactor tests "check" and "cash"
    @Test(arguments: [DepositType.check, DepositType.cash])
    func deposit_amount_using_check_or_cash_increases_balance(_ depositType: DepositType) {
        let bankAccount = BankAccount(accountNumber: "123456", balance: 500)
        bankAccount.deposit(amount: 200, depositType: depositType)  // .check and .cash is removed
        #expect(bankAccount.balance == 700)
    }
    
    // Transfer testing
    @Test
    func deposit_using_transfer_type_charges_fee() {
        let bankAccount = BankAccount(accountNumber: "123456", balance: 500)
//        let feePercentage = 0.02 // 2%
        let depositAmount = 200.0
        let expectedBalance = 696.0
        bankAccount.deposit(amount: depositAmount, depositType: .transfer)
        #expect(bankAccount.balance == expectedBalance)
    }
}
