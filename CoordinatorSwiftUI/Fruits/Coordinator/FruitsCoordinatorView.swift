//
//  FruitsCoordinatorView.swift
//  CoordinatorSwiftUI
//
//  Created by Denis Dmitriev on 02.08.2023.
//

import SwiftUI

struct FruitsCoordinatorView: View {
    
    @StateObject var coordinator: Coordinator<FruitsRouter>
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build(.fruits)
                .navigationTitle("Fruits 🛒")
                .navigationDestination(for: FruitsRouter.self) { route in
                    coordinator.build(route)
                }
                .sheet(item: $coordinator.sheet) { route in
                    coordinator.build(route)
                }
                .fullScreenCover(item: $coordinator.cover) { route in
                    coordinator.build(route)
                }
        }
        .environmentObject(coordinator)
        .onOpenURL { url in
            print(url)
            guard url.scheme == "coordinatorApp" else { return }
            switch url.host() {
            case Fruit.cherry.title:
                coordinator.push(.cherry(count: 1))
            case Fruit.lemon.title:
                coordinator.present(sheet: .lemon(count: 1))
            case Fruit.watermelon.title:
                coordinator.present(cover: .lemon(count: 1))
            default:
                return
            }
        }
    }
}

struct FruitsCoordinatorView_Previews: PreviewProvider {
    static var previews: some View {
        FruitsCoordinatorView(coordinator: Coordinator<FruitsRouter>())
    }
}
