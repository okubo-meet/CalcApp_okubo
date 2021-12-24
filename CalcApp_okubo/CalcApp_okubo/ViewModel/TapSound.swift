//
//  TapSound.swift
//  CalcApp_okubo
//
//  Created by 大久保徹郎 on 2021/12/03.
//

import Foundation

enum TapSound: String, CaseIterable {
    case sound_01 = "サウンド1"
    case sound_02 = "サウンド2"
    case sound_03 = "サウンド3"
    
    func toSoundName() -> String {
        switch self {
        case .sound_01:
            return "button01"
        case .sound_02:
            return "button02"
        case .sound_03:
            return "button03"
        }
    }
}
