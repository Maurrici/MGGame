//
//  ButtonsSection.swift
//  MGGame
//
//  Created by Gustavo Holzmann on 06/12/23.
//

import SwiftUI

struct ButtonsSection: View {
    let gameViewModel: GameViewModel
    
    var body: some View {
        HStack {
            Button {
                gameViewModel.quitRoom()
            } label: {
                HStack() {
                    Spacer()
                    Text("Exit")
                        .font(.nippoRegular(size: 32))
                        .foregroundColor(.black)
                    Spacer()
                }
                .padding(.horizontal)
                .background(ColorManager.Colors.pink.value)
            }
            
            Button {
                gameViewModel.setPlayerStatus()
            } label: {
                HStack() {
                    Spacer()
                    Text("Ready")
                        .font(.nippoRegular(size: 32))
                        .foregroundColor(.black)
                    Spacer()
                }
                .padding(.horizontal)
                .background(ColorManager.Colors.pink.value)
            }
        }
    }
}
