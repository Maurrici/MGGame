//
//  TestView.swift
//  MGGame
//
//  Created by Mauricio on 03/12/23.
//

import SwiftUI

struct HostJoinView: View {
    @StateObject var gameViewModel: GameViewModel = GameViewModel(userID: .init(), nickName: KeysService.getString(.username))
    @StateObject var router: HostJoinRoomRoute
    @State var isInRoom: Bool = false
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Pixelar")
                .font(.nippoRegular(size: 64))
                .foregroundColor(.black)
            
            Text("Available rooms:")
                .font(.nippoRegular(size: 24))
                .foregroundColor(.black)
            
            if gameViewModel.availableRooms.isEmpty {
                Rectangle()
                    .foregroundColor(ColorManager.Colors.lightBlue.value)
                    .overlay {
                        VStack {
                            ImageManager.UserConfig.EmptyRoomsArt.render
                                .resizable()
                                .aspectRatio(1, contentMode: .fit)
                                .frame(width: UIScreen.main.bounds.width * 0.4)
                                .padding()
                            Text("Nenhuma sala ativa")
                                .font(.nippoRegular(size: 18))
                                .foregroundColor(ColorManager.Colors.white.value)
                            Spacer()
                        }
                    }
            } else {
                Rectangle()
                    .foregroundColor(ColorManager.Colors.lightBlue.value)
                    .overlay {
                        ScrollView(.vertical) {
                            VStack {
                                ForEach(gameViewModel.availableRooms) { room in
                                    RoomCardView(room: room)
                                        .onTapGesture {
                                            gameViewModel.joinRoom(room: room)
                                            router.pushToWaitingRoomView(viewModel: gameViewModel)
                                        }
                                }
                                .padding(.top, 8)
                                .padding(.horizontal)
                                Spacer()
                            }
                        }
                    }
            }
            Spacer()
            
            Divider()
            
            Button {
                gameViewModel.createRoom(name: "\(gameViewModel.player.nickName)")
                router.pushToWaitingRoomView(viewModel: gameViewModel)
            } label: {
                HStack() {
                    Spacer()
                    Text("Create Room")
                        .font(.nippoRegular(size: 48))
                        .foregroundColor(.black)
                    Spacer()
                }
                .background(ColorManager.Colors.pink.value)
            }
            .padding(.horizontal)
        }
        .padding()
        .background(ColorManager.Colors.white.value)
    }
}
