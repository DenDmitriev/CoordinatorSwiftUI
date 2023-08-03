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
    
    var title: String? {
        switch self {
        case .vegetables:
            return "vegetables"
        case .fruits:
            return "fruits"
        }
    }
    
    var style: TransitionStyle? {
        return nil
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

