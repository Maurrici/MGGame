//
//  PlayerConfigRoute.swift
//  MGGame
//
//  Created by Gustavo Holzmann on 05/01/24.
//

import Foundation
import SwiftUI

enum PlayerConfigPages {
    
}

final class PlayerConfigRoute: Route {
    var id: UUID = .init()
    
    var coordinator: any Coordinator
    
    init(coordinator: any Coordinator) {
        self.coordinator = coordinator
    }
    
    func push(to page: PlayerConfigPages) {
        
    }
    
    func pushToConfigView(username: String) {
        coordinator.path.append(HostJoinRoomRoute(coordinator: self.coordinator))
    }
    
    @ViewBuilder func build() -> some View {
        PlayerConfigView(router: self)
            .navigationDestination(for: HostJoinRoomRoute.self) { route in
                route.build()
            }
    }
}
