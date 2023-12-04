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
                    ContentView()
                }
            }
            .animation(.default, value: splashScreenIsActive)
        }
    }
}
