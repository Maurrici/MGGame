//
//  ContentView.swift
//  MGGame
//
//  Created by Mauricio on 02/12/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = GameViewModel(userID: .init(), nickName: "Mauricio")
    
    var body: some View {
        HostJoinView(gameViewModel: viewModel)
    }
}

#Preview {
    ContentView()
}
