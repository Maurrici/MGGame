//
//  ColorModel.swift
//  CreativeThinking
//
//  Created by Mauricio on 02/12/23.
//

import Foundation
import SwiftUI

enum NamedColor: String, CaseIterable {
    case red
    case green
    case yellow
    
    var color: Color {
        switch self {
        case .red:
            return .red
        case .green:
            return .green
        case .yellow:
            return .yellow
        }
    }
}
