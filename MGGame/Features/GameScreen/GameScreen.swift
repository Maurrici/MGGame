//
//  GameScreen.swift
//  MGGame
//
//  Created by Gustavo Holzmann on 08/01/24.
//

import SwiftUI

struct GameScreenView: View {
    
    @StateObject var router: GameScreenRoute
    @ObservedObject var viewModel: GameViewModel

    var body: some View {
        VStack {
            Rectangle()
                .foregroundColor(ColorManager.Colors.lightBlue.value)
                .overlay {
                    Text("")
                    ScrollView(.vertical) {
                        VStack {
                            
                            }
                            .padding(.top, 8)
                            .padding(.horizontal)
                            Spacer()
                        }
                    }
                }
        }
}
