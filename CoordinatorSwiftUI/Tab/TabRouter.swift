//
//  TabRouter.swift
//  CoordinatorSwiftUI
//
//  Created by Denis Dmitriev on 02.08.2023.
//

import SwiftUI

enum TabRouter: NavigationRouter {
    case vegetables
    case fruits
    
    var id: Self {
        return self
    }
    
    @ViewBuilder
    func view() -> some View {
        switch self {
        case .vegetables:
            VegetablesCoordinatorView(coordinator: Coordinator<VegetablesRouter>())
        case .fruits:
            FruitsCoordinatorView(coordinator: Coordinator<FruitsRouter>())
        }
    }
}

