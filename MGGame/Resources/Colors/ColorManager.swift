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
        
        var value: Color {
            return Color(self.rawValue)
        }
        
    }
}
