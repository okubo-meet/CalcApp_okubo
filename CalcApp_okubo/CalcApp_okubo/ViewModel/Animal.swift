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
    ///動物の声の高さ（0.5〜2.0）
    func pitch() -> Float {
        switch self {
        case .alpaka:
            return 1.0
        case .dog:
            return 1.0
        case .rabbit:
            return 1.6
        case .bear:
            return 0.5
        case .elephant:
            return 0.5
        case .cat:
            return 1.4
        case .hamster:
            return 1.8
        case .panda:
            return 0.8
        case .chick:
            return 1.8
        case .pig:
            return 0.8
        case .penguin:
            return 1.4
        case .honeybee:
            return 2.0
        }
    }
    ///動物の話す速度（0.0〜1.0）
    func rate() -> Float {
        switch self {
        case .alpaka:
            return 0.4
        case .dog:
            return 0.5
        case .rabbit:
            return 0.5
        case .bear:
            return 0.5
        case .elephant:
            return 0.3
        case .cat:
            return 0.5
        case .hamster:
            return 0.4
        case .panda:
            return 0.5
        case .chick:
            return 0.5
        case .pig:
            return 0.4
        case .penguin:
            return 0.4
        case .honeybee:
            return 0.5
        }
    }
}
