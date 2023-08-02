//
//  AvocadoView.swift
//  CoordinatorSwiftUI
//
//  Created by Denis Dmitriev on 02.08.2023.
//

import SwiftUI

struct AvocadoView: View {
    var body: some View {
        Text("🥑")
            .font(.system(size: 150))
            .frame(maxWidth: .infinity, alignment: .center)
    }
}

struct AvocadoView_Previews: PreviewProvider {
    static var previews: some View {
        AvocadoView()
    }
}
