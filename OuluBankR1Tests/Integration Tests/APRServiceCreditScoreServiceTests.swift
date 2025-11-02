//
//  APRServiceCreditScoreServiceTests.swift
//  OuluBankR1Tests
//
//  Updated by Adam Cegielka on 02/11/2025.
//

import Testing
@testable import OuluBankR1

struct APRServiceCreditScoreServiceTests {
    
    // APR service should call get credit score on credit score service
    @Test
    func apr_service_calls_get_credit_score_on_credit_score_service() async throws {
        
        let validSSN = "123-45-6789"
        
        var mockCreditScoreService = MockCreditScoreService()
        
        try await confirmation("APRService did not call getCreditScore on mockCreditScoreService", expectedCount: 1) { confirmation in
            // need to make sure that mockCreditScoreService.getCreditScore is fired
            
            mockCreditScoreService.onGetCreditScore = { ssn in
            
                confirmation()
                return CreditScore(score: 500, lastUpdated: "11/02/2025", reportedBy: "Experian")
            }
            
            let aprService = APRService(creditScoreService: mockCreditScoreService)
            let _ = try await aprService.getAPR(ssn: validSSN)
        }
    }
    
    // APR service does not call get credit score for invalid ssn
    @Test
    func apr_service_does_not_call_get_credit_score_for_invalid_ssn() async throws {
        
        var mockCreditScoreService = MockCreditScoreService()
        
        await confirmation("APRService called CreditScoreService even with invalid ssn", expectedCount: 0) { confirmation in
            
            mockCreditScoreService.onGetCreditScore = { ssn in
                confirmation()
                return CreditScore(score: 500, lastUpdated: "11/02/2025", reportedBy: "Experian")
            }
            
            let aprService = APRService(creditScoreService: mockCreditScoreService)
            let _ = try? await aprService.getAPR(ssn: "not-a-valid")
        }
    }

}
