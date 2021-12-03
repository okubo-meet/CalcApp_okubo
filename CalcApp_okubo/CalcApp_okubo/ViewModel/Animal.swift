//
//  Animal.swift
//  CalcApp_okubo
//
//  Created by 大久保徹郎 on 2021/11/25.
//

import Foundation

enum Animal: String, CaseIterable {
    case alpaka = "アルパカ"
    case dog = "イヌ"
    case rabbit = "ウサギ"
    case bear = "クマ"
    case elephant = "ゾウ"
    case cat = "ネコ"
    case hamster = "ハムスター"
    case panda = "パンダ"
    case chick = "ヒヨコ"
    case pig = "ブタ"
    case penguin = "ペンギン"
    case honeybee = "ミツバチ"
    /// Viewに表示する画像を返す関数
    /// - Returns: 画像ファイル名
    func toImageString() -> String {
        switch self {
        case .alpaka:
            return "animal_arupaka"
        case .dog:
            return "animal_inu"
        case .rabbit:
            return "animal_usagi"
        case .bear:
            return "animal_kuma"
        case .elephant:
            return "animal_zou"
        case .cat:
            return "animal_neko"
        case .hamster:
            return "animal_hamster"
        case .panda:
            return "animal_panda"
        case .chick:
            return "animal_hiyoko"
        case .pig:
            return "animal_buta"
        case .penguin:
            return "animal_penguin"
        case .honeybee:
            return "animal_mitsubachi"
        }
    }
}
