//
//  PlayerCard.swift
//  MGGame
//
//  Created by Gustavo Holzmann on 06/12/23.
//

import SwiftUI

struct PlayerCard: View {
    let player: PlayerModel
    
    var body: some View {
        HStack {
            Text(player.nickName)
                .font(.nippoRegular(size: 16))
                .foregroundColor(.black)
            Spacer()
            Text(player.ready ? "ready: ✔️" : "ready: Ⅹ")
                .font(.nippoRegular(size: 16))
                .foregroundColor(.black)
        }
        .padding()
        .background(ColorManager.Colors.yellow.value)
        .padding(.horizontal)
    }
}
