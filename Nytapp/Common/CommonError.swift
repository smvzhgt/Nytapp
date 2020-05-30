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
    
    var localizedDescription: String {
        switch self {
        case .decodingDataError:
            return "Decoding Data Error"
        }
    }
}
