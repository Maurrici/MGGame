//
//  Host&JoinRoomRoute.swift
//  MGGame
//
//  Created by Gustavo Holzmann on 05/01/24.
//

import Foundation
import SwiftUI

enum HostJoinRoomPages {
    
}

final class HostJoinRoomRoute: Route {
    var id: UUID = .init()
    
    var coordinator: any Coordinator
    
    init(coordinator: any Coordinator) {
        self.coordinator = coordinator
    }
    
    func push(to page: HostJoinRoomPages) {
        
    }
    
    func pushToWaitingRoomView(viewModel: GameViewModel) {
        coordinator.path.append(WaitingRoomRoute(coordinator: self.coordinator, gameViewModel: viewModel))
    }
    
    @ViewBuilder func build() -> some View {
        HostJoinView(router: self)
    }
    
}
