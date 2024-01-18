//
//  GameScreenButtons.swift
//  MGGame
//
//  Created by Gustavo Holzmann on 18/01/24.
//

import SwiftUI

struct GameScreenButtons: View {
    let router: GameScreenRoute
    let viewModel: GameViewModel
    
    var body: some View {
        HStack {
            Button {
                router.pop()
            } label: {
                HStack {
                    Spacer()
                    Text("Exit")
                        .font(.nippoRegular(size: 32))
                        .foregroundColor(.black)
                        .background(ColorManager.Colors.pink.value)
                    Spacer()
                }
                .padding(.horizontal)
            }
            Button {
                print("Confirmado meu patrao!")
            } label: {
                HStack {
                    Spacer()
                    Text("Confirm")
                        .font(.nippoRegular(size: 32))
                        .foregroundColor(.black)
                        .background(ColorManager.Colors.pink.value)
                    Spacer()
                }
                .padding(.horizontal)
            }
        }
        .padding()
    }
}
