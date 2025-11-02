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
}
