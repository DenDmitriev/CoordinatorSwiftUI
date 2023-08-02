//
//  TabCoordinatorView.swift
//  CoordinatorSwiftUI
//
//  Created by Denis Dmitriev on 02.08.2023.
//

import SwiftUI

struct TabCoordinatorView: View {
    
    @StateObject var coordinator: TabCoordinator<TabRouter>
    
    var body: some View {
        TabView(selection: $coordinator.tab) {
            coordinator.build(.fruits)
                .tabItem {
                    Label("Fruits", systemImage: "circle.grid.cross")
                }
            coordinator.build(.vegetables)
                .tabItem {
                    Label("Vegetables", systemImage: "carrot")
                }
        }
        .environmentObject(coordinator)
    }
}

struct TabCoordinatorView_Previews: PreviewProvider {
    static var previews: some View {
        TabCoordinatorView(coordinator: TabCoordinator<TabRouter>(tab: .fruits))
    }
}
