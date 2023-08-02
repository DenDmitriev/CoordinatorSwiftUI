//
//  MapRouter.swift
//  CoordinatorSwiftUI
//
//  Created by Denis Dmitriev on 02.08.2023.
//

import SwiftUI

enum FruitsRouter: NavigationRouter {
    case fruits
    case cherry(count: Int)
    case lemon(count: Int)
    case watermelon(count: Int)
    
    var id: Self {
        return self
    }
    
    @ViewBuilder
    func view() -> some View {
        switch self {
        case .fruits:
            FruitsView()
        case .cherry(let count):
            CherryView(count: count)
        case .lemon(let count):
            LemonView(count: count)
        case .watermelon(let count):
            WatermelonView(count: count)
        }
    }
}
