//
//  FlowBuilder.swift
//  MGGame
//
//  Created by Gustavo Holzmann on 05/01/24.
//

import SwiftUI

public protocol Flow: AnyObject, Identifiable, Hashable, ObservableObject {}

public protocol FlowBuilder: Flow {
    associatedtype Build: View
    @ViewBuilder func build() -> Build
}

public extension Hashable where Self: Flow {
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
}
