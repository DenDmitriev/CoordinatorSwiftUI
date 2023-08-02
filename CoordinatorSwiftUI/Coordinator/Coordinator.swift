//
//  Coordinator.swift
//  CoordinatorSwiftUI
//
//  Created by Denis Dmitriev on 02.08.2023.
//

import SwiftUI

class Coordinator<Router: NavigationRouter>: ObservableObject {
    
    @Published var path = NavigationPath()
    
    @Published var sheet: Router?
    @Published var cover: Router?
    
    @Published var hasError: Bool = false
    
    var error: LocalizedError?
    
    func push(_ page: Router) {
        path.append(page)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    func present(sheet: Router) {
        self.sheet = sheet
    }
    
    func dismissSheet() {
        sheet = nil
    }
    
    func present(cover: Router) {
        self.cover = cover
    }
    
    func dismissCover() {
        cover = nil
    }
    
    func presentAlert(error: LocalizedError) {
        self.error = error
        hasError = true
    }
    
    @ViewBuilder
    func build(_ route: Router) -> some View {
        route.view()
    }
}
