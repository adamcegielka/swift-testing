//
//  EnvironmentValues+Extensions.swift
//  OuluBankR1
//
//  Created by Mohammad Azam on 2/15/25.
//  Updated by Adam Cegielka on 11/2/2025
//

import Foundation
import SwiftUI

extension EnvironmentValues {
    
    @Entry var aprService = APRService(creditScoreService: CreditScoreServiceFactory.current.service)
    
}
