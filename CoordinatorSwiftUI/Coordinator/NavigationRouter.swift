//
//  NavigationRouter.swift
//  CoordinatorSwiftUI
//
//  Created by Denis Dmitriev on 02.08.2023.
//

import SwiftUI

protocol NavigationRouter: Hashable, Identifiable {
    associatedtype V: View
    
    var style: TransitionStyle? { get }
    
    @ViewBuilder
    func view() -> V
}
