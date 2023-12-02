//
//  ContentView.swift
//  MGGame
//
//  Created by Mauricio on 02/12/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var session = GameConnection()
    
    var body: some View {
            VStack(alignment: .leading) {
                Text("Connected Devices:")
                Text(String(describing: session.connectedPeers.map(\.displayName)))

                Divider()

                HStack {
                    ForEach(NamedColor.allCases, id: \.self) { color in
                        Button(color.rawValue) {
                            session.send(color: color)
                        }
                        .padding()
                    }
                }
                Spacer()
            }
            .padding()
            .background((session.currentColor.map(\.color) ?? .clear).ignoresSafeArea())
        }
}

#Preview {
    ContentView()
}
