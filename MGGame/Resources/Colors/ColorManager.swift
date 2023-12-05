//
//  ColorManager.swift
//  MGGame
//
//  Created by Gustavo Holzmann on 04/12/23.
//

import Foundation
import SwiftUI

enum ColorManager {
    enum Colors: String {
        case white = "color-1"
        case yellow = "color-2"
        case pink = "color-3"
        case lightBlue = "color-4"
        case mediumBlue = "color-5"
        case darkBlue = "color-6"
        
        
        static var allColors: [Color] {
            return [
                Colors.yellow.value,
                Colors.pink.value,
                Colors.lightBlue.value,
                Colors.mediumBlue.value,
                Colors.darkBlue.value
            ]
        }
        
        var value: Color {
            return Color(self.rawValue)
        }
        
    }
}
