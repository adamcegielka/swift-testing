//
//  OuluBankR1UITests.swift
//  OuluBankR1UITests
//
//  Created by Mohammad Azam on 2/15/25.
//  Updated by Adam Cegielka on 11/2/2025
//

import XCTest

final class OuluBankR1UITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        app = XCUIApplication()
        app.launchArguments = ["UITEST"]
        app.launch()
    }
    
    // User can calculate APR successfully for valid SSN
    func test_user_can_calculate_apr_for_valid_ssn() {
        
        let ssnTextField = app.textFields["ssnTextField"]
        ssnTextField.tap()
        
        ssnTextField.typeText("123-45-6789")
        
        let calculateAPRButton = app.buttons["calculateAPRButton"]
        calculateAPRButton.tap()
        
        let aprText = app.staticTexts["aprText"]
        let aprTextExists = aprText.waitForExistence(timeout: 5.0)
        
        XCTAssertTrue(aprTextExists)
        XCTAssertNotEqual(aprText.label, "APR text should not be empty.")
    }
    
    // Displays error message when credit score was invalid or not found
    func test_displays_error_message_when_credit_score_was_not_found_for_ssn() {
        
        let expectedErrorMessage = "Credit score is unavailable or not applicable for the given SSN"
        
        let ssnTextField = app.textFields["ssnTextField"]
        ssnTextField.tap()
        
        ssnTextField.typeText("111-22-3333")
        
        let calculateAPRButton = app.buttons["calculateAPRButton"]
        calculateAPRButton.tap()
        
        let messageText = app.staticTexts["messageText"]
        let messageTextExists = messageText.waitForExistence(timeout: 5.0)
        
        XCTAssertTrue(messageTextExists, "Masage text should not be empty")
        XCTAssertEqual(messageText.label, expectedErrorMessage)
    }
}
