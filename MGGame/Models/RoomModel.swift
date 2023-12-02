//
//  RoomModel.swift
//  MGGame
//
//  Created by Mauricio on 02/12/23.
//

import Foundation

struct RoomModel: Codable {
    var id: UUID
    var name: String
    var hostID: String
}
