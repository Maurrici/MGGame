//
//  WaitingRoomRouter.swift
//  MGGame
//
//  Created by Gustavo Holzmann on 08/01/24.
//

import Foundation
import SwiftUI

enum WaitingRoomPages {
    
}

final class WaitingRoomRoute: Route {
    var id: UUID = .init()
    
    var coordinator: any Coordinator
    var viewModel: GameViewModel
    
    init(coordinator: any Coordinator, gameViewModel: GameViewModel) {
        self.coordinator = coordinator
        viewModel = gameViewModel
    }
    
    func push(to page: WaitingRoomPages) {
        
    }
    
    func pushToGameView() {
        coordinator.path.append(GameScreenRoute(coordinator: self.coordinator, viewModel: viewModel))
    }
    
    @ViewBuilder func build() -> some View {
        WaitingRoomView(gameViewModel: viewModel, router: self)
    }
}

