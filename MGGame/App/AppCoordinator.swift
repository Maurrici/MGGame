//
//  AppCoordinator.swift
//  MGGame
//
//  Created by Gustavo Holzmann on 05/01/24.
//
import SwiftUI

class AppCoordinator: Coordinator {
    let id: UUID = .init()
    
    @Published var path: NavigationPath
    
    init(path: NavigationPath = .init()) {
        self.path = path
    }
    
    func push<R: Route>(_ route: R) {
        self.path.append(route)
    }
    
    @ViewBuilder func build() -> some View {
        PlayerConfigRoute(coordinator: self)
            .build()
            .navigationDestination(for: HostJoinRoomRoute.self) { router in
                router.build()
            }
            .navigationDestination(for: WaitingRoomRoute.self) { router in
                router.build()
            }
            .navigationDestination(for: GameScreenRoute.self) { router in
                router.build()
            }
    }
}

