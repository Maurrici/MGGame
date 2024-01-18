//
//  WaitingRoomView.swift
//  MGGame
//
//  Created by Gustavo Holzmann on 06/12/23.
//

import SwiftUI

struct WaitingRoomView: View {
    @ObservedObject var gameViewModel: GameViewModel
    @StateObject var router: WaitingRoomRoute
    @State var viewId: UUID = .init()
    
    var body: some View {
        VStack(alignment: .leading) {
            WaitingRoomHeader(roomName: ("\(gameViewModel.myRoom?.name ?? "") Room"))
            
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Players:")
                        .font(.nippoRegular(size: 24))
                        .foregroundColor(.white)
                        .padding(.horizontal)
                    ForEach(gameViewModel.myRoom?.players ?? []) { player in
                        PlayerCard(player: player)
                    }
                }
                .id(viewId)
                
                Spacer()
            }
            .padding(.vertical)
            .background(ColorManager.Colors.lightBlue.value)
            
            Divider()
            
            ButtonsSection(gameViewModel: gameViewModel)
                .padding()

            if gameViewModel.myRoom?.hostID == gameViewModel.player.id {
                Button {
                    if gameViewModel.initGame() {
                        router.pushToGameView()
                    }
                } label: {
                    HStack {
                        Spacer()
                        Text("Start Game")
                            .font(.nippoRegular(size: 32))
                            .foregroundColor(.black)
                        Spacer()
                    }
                    .padding(.horizontal)
                    .background(ColorManager.Colors.pink.value)
                }
                Spacer()
            }
        }
        .padding(.horizontal)
        .onChange(of: gameViewModel.myRoom?.updateRoom){
            viewId = .init()
        }
        .onChange(of: gameViewModel.gameHasStarted) {
            print("Game comecou!")
            guard let myRoom = gameViewModel.myRoom else { return }
            gameViewModel.setStoryteller(numberOfPlayers: myRoom.players.count)
            router.pushToGameView()
        }
    }
}
