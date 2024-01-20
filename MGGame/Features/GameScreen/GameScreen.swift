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
    @State private var selectedImage: Image = ImageManager.UserConfig.EmptyRoomsArt.render
    
    var body: some View {
        VStack {
            ScrollView(.vertical) {
                VStack(alignment: .leading) {
                    Text(viewModel.player.isStoryteller ? "Your pick as the storyteller" : "Your pick")
                        .font(.nippoRegular(size: 24))
                        .foregroundColor(.black)
                    VStack {
                        selectedImage
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
                            Button {
                                selectedImage = ImageManager.GameIllustrations.ilustra_cat.render
                            } label: {
                                ImageManager.GameIllustrations.ilustra_cat.render
                                    .resizable()
                                    .frame(width: 64, height: 64)
                            }
                            Button {
                                selectedImage = ImageManager.GameIllustrations.ilustra_dark.render
                            } label: {
                                ImageManager.GameIllustrations.ilustra_dark.render
                                    .resizable()
                                    .frame(width: 64, height: 64)
                            }
                            Button {
                                selectedImage = ImageManager.GameIllustrations.ilustra_room.render
                            } label: {
                                ImageManager.GameIllustrations.ilustra_room.render
                                    .resizable()
                                    .frame(width: 64, height: 64)
                            }
                            Button {
                                selectedImage = ImageManager.GameIllustrations.ilustra_house.render
                            } label: {
                                ImageManager.GameIllustrations.ilustra_house.render
                                    .resizable()
                                    .frame(width: 64, height: 64)
                            }
                            Button {
                                selectedImage = ImageManager.GameIllustrations.ilustra_train.render
                            } label: {
                                ImageManager.GameIllustrations.ilustra_train.render                                    .resizable()
                                    .frame(width: 64, height: 64)
                            }
                            Button {
                                selectedImage = ImageManager.GameIllustrations.ilustra_hollow.render
                            } label: {
                                ImageManager.GameIllustrations.ilustra_hollow.render
                                    .resizable()
                                    .frame(width: 64, height: 64)
                            }
                            Button {
                                selectedImage = ImageManager.GameIllustrations.ilustra_memory.render
                            } label: {
                                ImageManager.GameIllustrations.ilustra_memory.render
                                    .resizable()
                                    .frame(width: 64, height: 64)
                            }
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
