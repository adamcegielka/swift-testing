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
    @Test(arguments: [("123-45-6789", 1.0...3.0), ("987-65-4321", 6.0...10.0)])
    func apr_is_within_expected_range_for_valid_ssn(params: (String, ClosedRange<Double>)) async throws {
        
        let (ssn, expectedAPRRange) = params
        
//        let ssn: String = "123-45-6789" // ssn with credit score > 650
//        let expectedAPRRange = 1.0...3.0
        
        let aprService = APRService(creditScoreService: MockCreditScoreService())
        let apr = try await aprService.getAPR(ssn: ssn)
        
        #expect(expectedAPRRange.contains(apr))
    }    
}
