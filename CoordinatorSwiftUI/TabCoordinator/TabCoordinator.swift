//
//  TabCoordinator.swift
//  CoordinatorSwiftUI
//
//  Created by Denis Dmitriev on 02.08.2023.
//

import SwiftUI

class TabCoordinator<Router: NavigationRouter>: ObservableObject {
    
    @Published var tab: Router
    
    init(tab: Router) {
        self.tab = tab
    }
    
    func change(_ route: Router) {
        self.tab = route
    }
    
    @ViewBuilder
    func build(_ route: Router) -> some View {
        route.view()
            .tag(route)
    }
}
