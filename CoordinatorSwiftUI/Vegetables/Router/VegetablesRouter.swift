//
//  VegetablesRouter.swift
//  CoordinatorSwiftUI
//
//  Created by Denis Dmitriev on 02.08.2023.
//

import SwiftUI

enum VegetablesRouter: NavigationRouter {
    case vegetables
    case two
    
    var id: Self {
        self
    }
    
    @ViewBuilder
    func view() -> some View {
        switch self {
        case .vegetables:
            VegetablesView()
        case .two:
            EmptyView()
        }
    }
}
