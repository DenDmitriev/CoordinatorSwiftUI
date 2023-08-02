//
//  WatermelonView.swift
//  CoordinatorSwiftUI
//
//  Created by Denis Dmitriev on 02.08.2023.
//

import SwiftUI

struct WatermelonView: View {
    
    @State var count: Int
    @EnvironmentObject var coordinator: Coordinator<FruitsRouter>
    
    var body: some View {
        List {
            Text("🍉")
            
            Text(count.formatted(.number))
            
            Button("Dismiss") {
                coordinator.dismissCover()
            }
        }
    }
}

struct WatermelonView_Previews: PreviewProvider {
    static var previews: some View {
        WatermelonView(count: .zero)
            .environmentObject(Coordinator<FruitsRouter>())
    }
}
