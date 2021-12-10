//
//  Speaker.swift
//  CalcApp_okubo
//
//  Created by 大久保徹郎 on 2021/12/10.
//

import Foundation
import SwiftUI

enum Speaker: String {
    //読み上げ中
    case on = "speaker.wave.3.fill"
    //読み上げなし
    case off = "speaker.slash.fill"
    
    func color() -> Color {
        switch self {
        case .on:
            return Color.buttonBulue
        case .off:
            return Color.gray
        }
    }
}
