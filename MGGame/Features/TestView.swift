//
//  TestView.swift
//  MGGame
//
//  Created by Mauricio on 03/12/23.
//

import SwiftUI

struct TestView: View {
    @ObservedObject var gameViewModel: GameViewModel
    
    @State var isInRoom: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Pixelar")
                .font(.nippoRegular(size: 64))
                .foregroundColor(.black)
            
            Text("Available rooms:")
                .font(.nippoRegular(size: 24))
                .foregroundColor(.black)
            
            if gameViewModel.rooms.isEmpty {
                Rectangle()
                    .foregroundColor(ColorManager.Colors.lightBlue.value)
            } else {
                Rectangle()
                    .foregroundColor(ColorManager.Colors.lightBlue.value)
                    .overlay {
                        
                        
                        ScrollView(.vertical) {
                            VStack {
                                ForEach(gameViewModel.rooms) { room in
                                    
                                    .padding()
                                    .background(ColorManager.Colors.pink.value)
                                    .onTapGesture {
                                        gameViewModel.joinRoom(room: room)
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
                gameViewModel.createRoom(name: "Sala de teste 123")
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
        .fullScreenCover(isPresented: $gameViewModel.isInRoom) {
            VStack {
                Text(gameViewModel.myRoom?.name ?? "")
                
                List {
                    ForEach(gameViewModel.myRoom?.players ?? []) { player in
                        Text("\(player.nickName) \(player.id.uuidString)")
                    }
                }
                
                Divider()
                
                Button {
                    gameViewModel.quitRoom()
                } label: {
                    Text("Sair")
                        .foregroundColor(.red)
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    TestView(gameViewModel: GameViewModel(userID: .init(), nickName: "Maurrici"))
}
