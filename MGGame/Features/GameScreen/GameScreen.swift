//
//  GameScreen.swift
//  MGGame
//
//  Created by Gustavo Holzmann on 08/01/24.
//

import SwiftUI

struct GameScreenView: View {
    
    @StateObject var router: GameScreenRoute
    @ObservedObject var viewModel: GameViewModel
    
    var body: some View {
        VStack {
            ScrollView(.vertical) {
                VStack(alignment: .leading) {
                    Text(viewModel.player.isStoryteller ? "Your pick as the storyteller" : "Your pick")
                        .font(.nippoRegular(size: 24))
                        .foregroundColor(.black)
                    VStack {
                        ImageManager.UserConfig.EmptyRoomsArt.render
                            .resizable()
                            .frame(width: 256, height: 256)
                        Text(viewModel.player.isStoryteller ? "Select your super word!" : "For the word: \(viewModel.selectedWord)")
                            .font(.nippoRegular(size: 16))
                            .foregroundColor(.white)
                        if viewModel.player.isStoryteller {
                            TextField("Type your word here", text: $viewModel.selectedWord)
                        }
                    }
                    .padding()
                    .background(ColorManager.Colors.lightBlue.value)
                }
                // Select your image carrousel session
                ScrollView(.horizontal) {
                    VStack(alignment: .leading) {
                        Text("Select your image")
                            .font(.nippoRegular(size: 24))
                            .foregroundColor(.black)
                            .padding(.leading)
                        HStack {
                            ImageManager.GameImages.EmptyRoomsArt.render
                                .resizable()
                                .frame(width: 64, height: 64)
                            ImageManager.GameImages.EmptyRoomsArt.render
                                .resizable()
                                .frame(width: 64, height: 64)
                            ImageManager.GameImages.EmptyRoomsArt.render
                                .resizable()
                                .frame(width: 64, height: 64)
                            ImageManager.GameImages.EmptyRoomsArt.render
                                .resizable()
                                .frame(width: 64, height: 64)
                            ImageManager.GameImages.EmptyRoomsArt.render
                                .resizable()
                                .frame(width: 64, height: 64)
                            ImageManager.GameImages.EmptyRoomsArt.render
                                .resizable()
                                .frame(width: 64, height: 64)
                        }
                        .padding()
                    }
                }
                .scrollIndicators(.never)
                .background(ColorManager.Colors.lightBlue.value)
                
            }
                        
            Spacer()
            
            GameScreenButtons(router: router, viewModel: viewModel)
        }
        .background(ColorManager.Colors.white.value)
    }
}
