//
//  ImageManager.swift
//  MGGame
//
//  Created by Gustavo Holzmann on 04/12/23.
//

import Foundation
import SwiftUI

enum ImageManager {
    enum UserConfig: String {
        case UserConfigArt
        case EmptyRoomsArt
        
        var render: Image {
            return Image(self.rawValue)
        }
    }
}
