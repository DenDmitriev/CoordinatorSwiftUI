//
//  VegetablesCoordinatorView.swift
//  CoordinatorSwiftUI
//
//  Created by Denis Dmitriev on 02.08.2023.
//

import SwiftUI

struct VegetablesCoordinatorView: View {
    
    @StateObject var coordinator: Coordinator<VegetablesRouter>
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build(.vegetables)
        }
        .environmentObject(coordinator)
    }
}

struct VegetablesCoordinatorView_Previews: PreviewProvider {
    static var previews: some View {
        VegetablesCoordinatorView(coordinator: Coordinator<VegetablesRouter>())
    }
}
