//
//  CreditScoreServiceFactory.swift
//  OuluBankR1
//
//  Created by Mohammad Azam on 2/15/25.
//  Updated by Adam Cegielka on 11/2/2025
//

import Foundation

enum CreditScoreServiceFactory {
    
    case testing
    case production
    
    static var current: CreditScoreServiceFactory {
        ProcessInfo.processInfo.arguments.contains("UITEST") ? .testing: .production
    }
    
    var service: CreditScoreServiceProtocol {
        switch self {
        case .testing:
            return MockCreditScoreService()
        case .production:
            return CreditScoreService()
        }
    }
   
}
