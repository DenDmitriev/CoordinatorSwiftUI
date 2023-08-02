//
//  ContentView.swift
//  CoordinatorSwiftUI
//
//  Created by Denis Dmitriev on 02.08.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabCoordinatorView(coordinator: TabCoordinator<TabRouter>(tab: .fruits))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
