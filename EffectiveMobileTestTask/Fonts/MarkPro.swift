//
//  MarkPro.swift
//  EffectiveMobileTestTask
//
//  Created by Виктор Шималин on 11.12.2022.
//

import Foundation
import SwiftUI

struct MarkPro {
    enum Style: String {
        case medium = "MarkPro-Medium"
        case bold = "MarkPro-Bold"
        case heavy = "MarkPro-Heavy"
        case normal = "MarkPro"
    }
    
    private let style: Style
    
    private let size: CGFloat
    
    var font: Font {
        return Font.custom(style.rawValue, size: size)
    }
    
    init(style: Style, size: CGFloat) {
        self.style = style
        self.size = size
    }
}
