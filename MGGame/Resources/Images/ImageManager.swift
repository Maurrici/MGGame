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
    
    enum GameImages: String {
        case UserConfigArt
        case EmptyRoomsArt
        
        var render: Image {
            return Image(self.rawValue)
        }
    }
    
    enum gameIllustrations: String {
        case ilustra_cat
        case ilustra_dark
        case ilustra_room
        case ilustra_train
        case ilustra_memory
        case ilustra_house
        case ilustra_hollow
        
        var render: Image {
            return Image(self.rawValue)
        }
    }
}
