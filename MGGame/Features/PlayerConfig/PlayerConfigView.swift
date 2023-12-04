//
//  PlayerConfig.swift
//  MGGame
//
//  Created by Mauricio on 04/12/23.
//

import SwiftUI

struct PlayerConfigView: View {
    @AppStorage("userId") var userId = UUID().uuidString
    @AppStorage("nickName") var nickName = ""
    
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
                nickName = textValue
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

#Preview {
    PlayerConfigView()
}
