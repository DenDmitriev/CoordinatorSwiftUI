//
//  TomatoView.swift
//  CoordinatorSwiftUI
//
//  Created by Denis Dmitriev on 02.08.2023.
//

import SwiftUI

struct TomatoView: View {
    var body: some View {
        Text("🍅")
            .font(.system(size: 150))
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
    }
}

struct TomatoView_Previews: PreviewProvider {
    static var previews: some View {
        TomatoView()
    }
}
