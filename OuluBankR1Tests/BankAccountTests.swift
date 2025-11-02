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

    // When deposit using check or cash then bank balance increases.
    @Test
    func deposit_amount_using_check_increases_balance() {
        // AREANGE
        let bankAccount = BankAccount(accountNumber: "123456", balance: 500)
        // ACT
        try? bankAccount.deposit(amount: 200, depositType: .check)
        // ASSERT
        #expect(bankAccount.balance == 700)
    }
    
    @Test
    func deposit_amount_using_cash_increases_balance() {
        // AREANGE
        let bankAccount = BankAccount(accountNumber: "123456", balance: 500)
        // ACT
        try? bankAccount.deposit(amount: 200, depositType: .cash)
        // ASSERT
        #expect(bankAccount.balance == 700)
    }
    
    // Refactor tests "check" and "cash"
    @Test(arguments: [DepositType.check, DepositType.cash])
    func deposit_amount_using_check_or_cash_increases_balance(_ depositType: DepositType) {
        let bankAccount = BankAccount(accountNumber: "123456", balance: 500)
        try? bankAccount.deposit(amount: 200, depositType: depositType)  // .check and .cash is removed
        #expect(bankAccount.balance == 700)
    }
    
    // When deposit using transfer then charge fee to amount deposited
    @Test
    func deposit_using_transfer_type_charges_fee() {
        let bankAccount = BankAccount(accountNumber: "123456", balance: 500)
        let depositAmount = 200.0
        let expectedBalance = 696.0
        try? bankAccount.deposit(amount: depositAmount, depositType: .transfer)
        #expect(bankAccount.balance == expectedBalance)
    }
    
    // Depositing negative amount is not allowed
    @Test
    func depositing_negative_amount_is_not_allowed() {
        let bankAccount = BankAccount(accountNumber: "123456", balance: 500)
        try? bankAccount.deposit(amount: -100, depositType: .check)
        #expect(bankAccount.balance == 500)
    }
    
    @Test
    func depositing_negative_amount_results_in_invalid_deposit_error() {
        let bankAccount = BankAccount(accountNumber: "123456", balance: 500)
        #expect(throws: BankAccountError.invalidAmount, "Depositing negative amount did not throw an errror", performing: {
            try bankAccount.deposit(amount: -10, depositType: .cash)
        })
    }
}
