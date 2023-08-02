//
//  CherryView.swift
//  CoordinatorSwiftUI
//
//  Created by Denis Dmitriev on 02.08.2023.
//

import SwiftUI

struct CherryView: View {
    
    @State var count: Int
    @EnvironmentObject var coordinator: Coordinator<FruitsRouter>
    
    var body: some View {
        List {
            Text(count.formatted(.number))
            
            Button("Dismiss") {
                coordinator.pop()
            }
        }
        .navigationBarTitleDisplayMode(.large)
        .navigationTitle("🍒")
    }
}

struct CityView_Previews: PreviewProvider {
    static var previews: some View {
        CherryView(count: .zero)
            .environmentObject(Coordinator<FruitsRouter>())
    }
}
