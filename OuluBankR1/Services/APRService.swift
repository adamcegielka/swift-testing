//
//  APRService.swift
//  OuluBankR1
//
//  Created by Mohammad Azam on 2/15/25.
//  Updated by Adam on 11/2/2025.
//

import Foundation

enum CreditScoreServiceError: LocalizedError {
    case noCreditScoreFound
    
    // Provide localized error descriptions
    var errorDescription: String? {
        switch self {
        case .noCreditScoreFound:
            return NSLocalizedString(
                "No credit score found for the provided SSN",
                comment: "Error message when no credit score is found"
            )
        }
    }
}

struct APRService {
    
    // third part service
    let creditScoreService: CreditScoreServiceProtocol
    
    func getAPR(ssn: String) async throws -> Double {
        guard let creditScore = try await creditScoreService.getCreditScore(ssn: ssn) else {
            throw CreditScoreServiceError.noCreditScoreFound
        }
        
        if let score = creditScore.score {
            if score > 650 {
                return Double.random(in: 1...3)
            } else {
                return Double.random(in: 6...10)
            }
        } else {
            throw CreditScoreServiceError.noCreditScoreFound
        }
    }
}


