//
//  RoomCardView.swift
//  MGGame
//
//  Created by Gustavo Holzmann on 05/12/23.
//

import SwiftUI

struct RoomCardView: View {
    
    let room: RoomModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("\(room.name)")
                    .font(.nippoRegular(size: 18))
                    .foregroundColor(.black)
                Text("locked with password")
                    .font(.nippoRegular(size: 13))
                    .foregroundColor(.black)
            }
            Spacer()
            
            Text("3/7")
        }
    }
}
