//
//  WidgetURLCreator.swift
//  CoordinatorSwiftUI
//
//  Created by Denis Dmitriev on 03.08.2023.
//

import Foundation

struct WidgetURLCreator<Router: Titleable> {
    
    static func url(route: Router) -> URL? {
        let scheme = "coordinatorApp"
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme
        urlComponents.host = route.title
        return urlComponents.url
    }
}
