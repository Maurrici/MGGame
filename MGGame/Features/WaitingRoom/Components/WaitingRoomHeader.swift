//
//  WaitingRoomHeader.swift
//  MGGame
//
//  Created by Gustavo Holzmann on 06/12/23.
//

import SwiftUI

struct WaitingRoomHeader: View {
    
    let roomName: String
    
    var body: some View {
        Group {
            Text("Pixelar")
                .font(.nippoRegular(size: 64))
                .foregroundColor(.black)
            
            Text(roomName)
                .font(.nippoRegular(size: 24))
                .foregroundColor(.black)
        }
    }
}
