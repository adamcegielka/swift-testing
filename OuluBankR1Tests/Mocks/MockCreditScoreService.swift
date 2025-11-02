//
//  MockCreditScoreService.swift
//  OuluBankR1
//
//  Created by Adam Cegielka on 02/11/2025.
//

import Foundation
@testable import OuluBankR1

struct MockCreditScoreService: CreditScoreServiceProtocol {
    
    func getCreditScore(ssn: String) async throws -> CreditScore? {
        switch ssn {
        case "123-45-6789": // good credit score
            return CreditScore(score: 720, lastUpdated: "02/11/2025", reportedBy: "Experian")
        case "987-65-4321": // bad credit score
            return CreditScore(score: 540, lastUpdated: "01/11/2025", reportedBy: "Experian")
        default: // no credit score
            return nil
        }
    }
}
