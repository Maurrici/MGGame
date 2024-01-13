//
//  GameScreenRoute.swift
//  MGGame
//
//  Created by Gustavo Holzmann on 08/01/24.
//

import Foundation
import SwiftUI

enum GameScreenPages {
    
}

final class GameScreenRoute: Route {
    var id: UUID = .init()
    
    var coordinator: any Coordinator
    var viewModel: GameViewModel
    
    init(coordinator: any Coordinator, viewModel: GameViewModel) {
        self.coordinator = coordinator
        self.viewModel = viewModel
    }
    
    func push(to page: GameScreenPages) {
        
    }
    
    @ViewBuilder func build() -> some View {
        GameScreenView(router: self, viewModel: viewModel)
    }
}
