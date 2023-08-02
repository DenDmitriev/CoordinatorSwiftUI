//
//  VegetablesCoordinatorView.swift
//  CoordinatorSwiftUI
//
//  Created by Denis Dmitriev on 02.08.2023.
//

import SwiftUI

struct VegetablesCoordinatorView: View {
    
    @StateObject var coordinator: Coordinator<VegetablesRouter>
    @State private var sheetSize: CGSize = .zero
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build(.vegetables)
                .alert("Error", isPresented: $coordinator.hasError, actions: {
                    Button("Ok", role: .cancel) {
                        print("alert dismiss")
                    }
                }, message: {
                    Text(coordinator.error?.localizedDescription
                         ?? VegetableError.unknown.localizedDescription)
                })
                .sheet(item: $coordinator.sheet) { sheet in
                    switch sheet.style {
                    case .fit:
                        coordinator.build(sheet)
                            .padding()
                            .background() {
                                GeometryReader { geometry in
                                    Path { path in
                                        sheetSize = geometry.size
                                    }
                                }
                            }
                            .presentationDetents([.height(sheetSize.height), .medium, .large])
                    default:
                        coordinator.build(sheet)
                    }
                    
                }
        }
        .environmentObject(coordinator)
    }
}

struct VegetablesCoordinatorView_Previews: PreviewProvider {
    static var previews: some View {
        VegetablesCoordinatorView(coordinator: Coordinator<VegetablesRouter>())
    }
}
