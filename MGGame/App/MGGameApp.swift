//
//  MGGameApp.swift
//  MGGame
//
//  Created by Mauricio on 02/12/23.
//

import SwiftUI

@main
struct MGGameApp: App {
    @State private var splashScreenIsActive: Bool = true
    @StateObject private var appCoordinator = AppCoordinator()
    
    var body: some Scene {
        WindowGroup {
            Group {
                if splashScreenIsActive {
                    SplashScreenView()
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                                self.splashScreenIsActive = false
                            }
                        }
                } else {
                    NavigationStack(path: $appCoordinator.path) {
                        appCoordinator.build()
                    }
                }
            }
            .animation(.easeInOut, value: splashScreenIsActive)
        }
    }
}
