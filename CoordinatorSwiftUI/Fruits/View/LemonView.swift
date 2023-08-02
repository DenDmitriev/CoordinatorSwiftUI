//
//  LemonView.swift
//  CoordinatorSwiftUI
//
//  Created by Denis Dmitriev on 02.08.2023.
//

import SwiftUI

struct LemonView: View {
    
    @State var count: Int
    @EnvironmentObject var coordinator: Coordinator<FruitsRouter>
    
    var body: some View {
        List {
            Text("🍋")
            
            Text(count.formatted(.number))
            
            Button("Dismiss") {
                coordinator.dismissSheet()
            }
        }
    }
}

struct LemonView_Previews: PreviewProvider {
    static var previews: some View {
        LemonView(count: .zero)
            .environmentObject(Coordinator<FruitsRouter>())
    }
}
