//
//  WaitingRoomView.swift
//  MGGame
//
//  Created by Gustavo Holzmann on 06/12/23.
//

import SwiftUI

struct WaitingRoomView: View {
    let gameViewModel: GameViewModel
    @State var viewId: UUID = .init()
    
    var body: some View {
        VStack(alignment: .leading) {
            WaitingRoomHeader(roomName: gameViewModel.myRoom?.name ?? "Sala sem nome")
            
            VStack(alignment: .leading, spacing: 20) {
                ForEach(gameViewModel.myRoom?.players ?? []) { player in
                    if player.id == gameViewModel.myRoom?.hostID {
                        Text("HOST:")
                            .font(.nippoRegular(size: 24))
                            .foregroundColor(.white)
                            .padding(.horizontal)
                    } else {
                        Text("Players:")
                            .font(.nippoRegular(size: 24))
                            .foregroundColor(.white)
                            .padding(.horizontal)
                    }
                    PlayerCard(player: player)
                    
                }
                Spacer()
            }
            .id(viewId)
            .padding(.vertical)
            .background(ColorManager.Colors.lightBlue.value)
            
            Divider()
            
            ButtonsSection(gameViewModel: gameViewModel)
            .padding()
        }
        .padding(.horizontal)
        .onChange(of: gameViewModel.myRoom?.updateRoom){
            viewId = .init()
        }
    }
}
