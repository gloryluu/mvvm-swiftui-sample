//
//  Error.swift
//  mvvm-swiftui-demo
//
//  Created by Quang Luu on 27/02/2023.
//

import Foundation

enum MyError: LocalizedError {
    
    case basic
    
    var errorDescription: String? {
        switch self {
        case .basic:
            return "Basic Title Error"
        }
    }
    
    var recoverySuggestion: String? {
        switch self {
        case .basic:
            return "Basic Title Message"
        }
    }
}
