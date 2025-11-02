//
//  APRServiceTests.swift
//  OuluBankR1Tests
//
//  Created by Mohammad Azam on 2/15/25.
//  Updated by Adam on 11/2/2025.
//

import Testing
@testable import OuluBankR1

struct APRServiceTests {
    
    // APR is calculated within expected range for valid SSN
    @Test
    func apr_is_wthin_expected_range_for_valid_ssn() async throws {
        let ssn: String = "123-45-6789" // ssn with credit score > 650
        let expectedAPRRange = 1.0...3.0
        let aprService = APRService(creditScoreService: CreditScoreService())
        let apr = try await aprService.getAPR(ssn: ssn)
        #expect(expectedAPRRange.contains(apr))
    }    
}
