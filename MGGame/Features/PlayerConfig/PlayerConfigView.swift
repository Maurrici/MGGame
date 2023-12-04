//
//  PlayerConfig.swift
//  MGGame
//
//  Created by Mauricio on 04/12/23.
//

import SwiftUI

struct PlayerConfigView: View {
    var body: some View {
        VStack {
            ImageManager.UserConfig.UserConfigArt.render
                .resizable()
                .aspectRatio(1, contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width * 0.8)
            
            Button {
                print("Click")
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
        .background(ColorManager.Colors.white.value)
    }
}

#Preview {
    PlayerConfigView()
}
