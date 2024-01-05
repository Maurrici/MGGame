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
    @AppStorage("username") var userName = ""
    
    @State var textValue = ""
    
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
                    TextField("Type your username", text: $textValue)
                        .background(ColorManager.Colors.white.value)
                        .padding(4)
                }
                .padding(.all)
                .background(ColorManager.Colors.yellow.value)
            }
            
            Spacer()
            
            Button {
                KeysService.set(textValue, for: .username)
                router.pushToConfigView(username: userName)
                print(userName)
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
