//
//  VegetablesRouter.swift
//  CoordinatorSwiftUI
//
//  Created by Denis Dmitriev on 02.08.2023.
//

import SwiftUI

enum VegetablesRouter: NavigationRouter {
    case vegetables
    case avocado
    case tomato
    
    var id: Self {
        self
    }
    
    var title: String? {
        switch self {
        case .vegetables:
            return "vegetables"
        case .avocado:
            return "avocado"
        case .tomato:
            return "tomato"
        }
    }
    
    var style: TransitionStyle? {
        switch self {
        case .avocado:
            return .fit
        default:
            return nil
        }
    }
    
    @ViewBuilder
    func view() -> some View {
        switch self {
        case .vegetables:
            VegetablesView()
        case .avocado:
            AvocadoView()
        case .tomato:
            TomatoView()
        }
    }
}
