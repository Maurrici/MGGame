//
//  GenericMessage.swift
//  MGGame
//
//  Created by Mauricio on 02/12/23.
//

import Foundation

struct GenericMessage<T: Codable>: Codable {
    var type: String
    var data: T
}

enum MessageType: String {
    case newRoom
    case joinRoom
    case quitRoom
    case playerReady
}
