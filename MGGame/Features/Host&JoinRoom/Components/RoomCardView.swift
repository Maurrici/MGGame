//
//  RoomCardView.swift
//  MGGame
//
//  Created by Gustavo Holzmann on 05/12/23.
//

import SwiftUI

struct RoomCardView: View {
    
    let room: RoomModel
    let numberOfPlayers: Int
    
    init(room: RoomModel) {
        self.room = room
        self.numberOfPlayers = room.players?.count ?? 1
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("\(room.name)")
                    .font(.nippoRegular(size: 18))
                    .foregroundColor(.black)
            }
            Spacer()
            
            Text("\(numberOfPlayers)/8")
        }
        .padding()
        .background(ColorManager.Colors.pink.value)
    }
}
