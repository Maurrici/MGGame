//
//  PlayerConfig.swift
//  MGGame
//
//  Created by Mauricio on 04/12/23.
//

import SwiftUI

struct PlayerConfigView: View {
    @StateObject var router: PlayerConfigRoute
    @AppStorage("userId") var userId = UUID().uuidString
    @AppStorage("username") var userName = KeysService.getString(.username)
        
    var body: some View {
        VStack {
            ImageManager.UserConfig.UserConfigArt.render
                .resizable()
                .aspectRatio(1, contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width * 0.6)
            
            Spacer()
            
            VStack(alignment: .leading) {
                Text("Who are you?")
                    .font(.nippoRegular(size: 40))
                    .foregroundStyle(.black)
                    .padding(.bottom, -10)

                ZStack {
                    TextField("Type your username", text: $userName)
                        .background(ColorManager.Colors.white.value)
                        .padding(4)
                }
                .padding(.all)
                .background(ColorManager.Colors.yellow.value)
            }
            
            Spacer()
            
            Button {
                KeysService.set(userName, for: .username)
                router.pushToConfigView(username: userName)
            } label: {
                HStack() {
                    Spacer()
                    Text("Connect")
                        .font(.nippoRegular(size: 48))
                        .foregroundColor(.black)
                    Spacer()
                }
                .background(ColorManager.Colors.pink.value)
            }
            .padding(.horizontal)
        }
        .padding(.all)
        .background(ColorManager.Colors.white.value)
    }
}
