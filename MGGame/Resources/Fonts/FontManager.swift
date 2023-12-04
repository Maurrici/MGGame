//
//  FontManager.swift
//  MGGame
//
//  Created by Gustavo Holzmann on 05/12/23.
//

import SwiftUI

extension Font {
    // MARK: Nippo
    static func nippoBold(size: CGFloat) -> Font {
        .custom("Nippo-Bold", size: size)
    }
    
    static func nippoMedium(size: CGFloat) -> Font {
        .custom("Nippo-Medium", size: size)
    }
    static func nippoRegular(size: CGFloat) -> Font {
        .custom("Nippo-Regular", size: size)
    }
    
    static func nippoLight(size: CGFloat) -> Font {
        .custom("Nippo-Light", size: size)
    }
    static func nippoExtralight(size: CGFloat) -> Font {
        .custom("Nippo-Extralight", size: size)
    }
}
