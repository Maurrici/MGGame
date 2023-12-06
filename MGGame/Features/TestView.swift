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
            Text("Salas:")
            List {
                ForEach(gameViewModel.rooms) { room in
                    Text("\(room.name)")
                        .onTapGesture {
                            gameViewModel.joinRoom(room: room)
                        }
                }
            }
            
            Divider()
            
            Button {
                gameViewModel.createRoom(name: "Sala de teste 123")
            } label: {
                HStack(alignment: .center) {
                    Text("Cria sala")
                }
            }
            .padding()
            Spacer()
        }
        .padding()
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
