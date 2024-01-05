//
//  Coordinator.swift
//  MGGame
//
//  Created by Gustavo Holzmann on 05/01/24.
//

import Foundation
import SwiftUI

protocol Coordinator: FlowBuilder {
    var id: UUID { get }
    var path: NavigationPath { get set }

    func push<R: Route>(_ route: R)
}

extension Coordinator {
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.path == rhs.path &&
        lhs.id == rhs.id
    }
    
    func pop() {
        self.path.removeLast()
    }
    
    func popToRoot() {
        self.path.removeLast(path.count)
    }
}
