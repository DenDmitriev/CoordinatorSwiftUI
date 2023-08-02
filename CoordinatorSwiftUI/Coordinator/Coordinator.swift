//
//  Coordinator.swift
//  CoordinatorSwiftUI
//
//  Created by Denis Dmitriev on 02.08.2023.
//

import SwiftUI

protocol CoordinatorProtocol: ObservableObject {
    associatedtype V: View
    associatedtype Router: NavigationRouter
    
    var path: NavigationPath { get set }
    var sheet: Router?  { get set }
    var cover: Router?  { get set }
    
    @ViewBuilder
    func build(_ route: Router) -> V
    
    func push(_ page: Router)
    func pop()
    func popToRoot()
    func present(sheet: Router)
    func dismissSheet()
    func present(cover: Router)
    func dismissCover()
}

class Coordinator<Router: NavigationRouter>: ObservableObject {
    
    @Published var path = NavigationPath()
    @Published var sheet: Router?
    @Published var cover: Router?
    
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
    
    @ViewBuilder
    func build(_ route: Router) -> some View {
        route.view()
    }
}
