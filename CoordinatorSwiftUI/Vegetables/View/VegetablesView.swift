//
//  VegetablesView.swift
//  CoordinatorSwiftUI
//
//  Created by Denis Dmitriev on 02.08.2023.
//

import SwiftUI

struct VegetablesView: View {
    
    @EnvironmentObject var coordinator: Coordinator<VegetablesRouter>
    @EnvironmentObject var tabCoordinator: TabCoordinator<TabRouter>
    
    var body: some View {
        List {
            Button("To fruits") {
                tabCoordinator.change(.fruits)
            }

        }
    }
}

struct VegetablesView_Previews: PreviewProvider {
    static var previews: some View {
        VegetablesView()
            .environmentObject(Coordinator<VegetablesRouter>())
            .environmentObject(TabCoordinator<TabRouter>(tab: .fruits))
    }
}
