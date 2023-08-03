//
//  Fruit.swift
//  CoordinatorSwiftUI
//
//  Created by Denis Dmitriev on 03.08.2023.
//

import Foundation

enum Fruit: String, Titleable, Emojiable, CaseIterable {
    case cherry
    case lemon
    case watermelon
    
    var emoji: String {
        switch self {
        case .cherry:
            return "🍒"
        case .lemon:
            return "🍋"
        case .watermelon:
            return "🍉"
        }
    }
    
    var title: String? {
        return self.rawValue
    }
    
    var url: URL? {
        return WidgetURLCreator<Self>.url(route: self)
    }
}
