//
//  PlayerModel.swift
//  MGGame
//
//  Created by Mauricio on 03/12/23.
//

import Foundation

struct PlayerModel: Codable, Identifiable {
    var id: UUID
    var nickName: String
    var ready: Bool = false
}
