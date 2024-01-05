//
//  Route.swift
//  MGGame
//
//  Created by Gustavo Holzmann on 05/01/24.
//

import Foundation
import SwiftUI

protocol Route: FlowBuilder {
    associatedtype Pages
    associatedtype ContentView: View
    
    var id: UUID { get }
    var coordinator: any Coordinator { get }

    func push(to page: Pages)
    func build() -> ContentView
}

extension Route {
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }
    
    func pop() {
        coordinator.pop()
    }
    
    func popToRoot() {
        coordinator.popToRoot()
    }
}
