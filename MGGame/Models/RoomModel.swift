//
//  RoomModel.swift
//  MGGame
//
//  Created by Mauricio on 02/12/23.
//

import Foundation

struct RoomModel: Codable, Identifiable {
    var id: UUID
    var name: String
    var hostID: UUID
    var players: [PlayerModel]?
}

struct RoomJoinPlayer: Codable {
    var roomId: UUID
    var player: PlayerModel
}

struct RoomQuitPlayer: Codable {
    var roomId: UUID
    var playerId: UUID
}
