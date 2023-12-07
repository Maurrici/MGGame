//
//  PlayerStatusModel.swift
//  MGGame
//
//  Created by Gustavo Holzmann on 06/12/23.
//

import Foundation

struct PlayerStatusModel: Codable {
    var userId: UUID
    var ready: Bool
}
