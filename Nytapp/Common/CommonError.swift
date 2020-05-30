//
//  CommonError.swift
//  Nytapp
//
//  Created by oleg on 30.05.2020.
//  Copyright © 2020 Nytapp. All rights reserved.
//

import Foundation

enum CommonError: Error {
    
    case decodingDataError
    case networkError(error: Error)
    case invalidData
    
    var localizedDescription: String {
        switch self {
        case .decodingDataError:
            return "Decoding Data Error"
        case let .networkError(error):
            return "Error:\n\(error.localizedDescription)"
        case let .invalidData:
            return "Server error"
        }
    }
}
