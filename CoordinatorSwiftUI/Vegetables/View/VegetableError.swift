//
//  VegetableError.swift
//  CoordinatorSwiftUI
//
//  Created by Denis Dmitriev on 02.08.2023.
//

import Foundation

enum VegetableError: Error {
    case unknown
    case over(vegetable: String)
}

extension VegetableError: LocalizedError {
    var errorDescription: String? {
        let comment = "Vegetable error description"
        switch self {
        case .unknown:
            return NSLocalizedString("Something went wrong", comment: comment)
        case .over(let vegetable):
            return  NSLocalizedString("\(vegetable.capitalized) are over.", comment: comment)
        }
    }
}
