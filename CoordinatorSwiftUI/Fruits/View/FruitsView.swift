//
//  FruitsView.swift
//  CoordinatorSwiftUI
//
//  Created by Denis Dmitriev on 02.08.2023.
//

import SwiftUI

struct FruitsView: View {
    
    @EnvironmentObject var coordinator: Coordinator<FruitsRouter>
    @EnvironmentObject var tabCoordinator: TabCoordinator<TabRouter>
    
    @State var count: String = ""
    
    var body: some View {
        List {
            Section {
                TextField("Count", text: $count)
            }
            
            Section {
                Button("Push 🍒") {
                    coordinator.push(.cherry(count: Int(count) ?? .zero))
                }
                
                Button("Sheet 🍋") {
                    coordinator.present(sheet: .lemon(count: Int(count) ?? .zero))
                }
                
                Button("Cover 🍉") {
                    coordinator.present(cover: .watermelon(count: Int(count) ?? .zero))
                }
            }
            
            Section {
                Button("Tab 🥕") {
                    tabCoordinator.change(.vegetables)
                }
            }
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        FruitsView()
            .environmentObject(Coordinator<FruitsRouter>())
    }
}
