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
            Section {
                Button("Alert 🥦") {
                    coordinator.presentAlert(error: VegetableError.over(vegetable: "🥦"))
                }
                
                Button("Sheet 🍅") {
                    coordinator.present(sheet: .tomato)
                }
                
                Button("Dynamic Sheet 🥑") {
                    coordinator.present(sheet: .avocado)
                }
            }
            
            Button("To fruits 🍒") {
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
