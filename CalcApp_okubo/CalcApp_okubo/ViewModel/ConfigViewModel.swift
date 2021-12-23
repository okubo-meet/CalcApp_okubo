//
//  ConfigViewModel.swift
//  CalcApp_okubo
//
//  Created by 大久保徹郎 on 2021/12/17.
//

import UIKit

class ConfigViewModel: ObservableObject {
    /// 選択中の動物
    @Published var animal: Animal {
        didSet {
            UserDefaults.standard.set(animal.rawValue, forKey: "animal")
        }
    }
    /// 選択中の言語
    @Published var language: Language {
        didSet {
            UserDefaults.standard.set(language.rawValue, forKey: "language")
        }
    }
    /// 選択中のタップ音
    @Published var tapSound: TapSound {
        didSet {
            UserDefaults.standard.set(tapSound.rawValue, forKey: "tapSound")
        }
    }
    /// 入力可能桁数
    @Published var digit: Digit {
        didSet {
            UserDefaults.standard.set(digit.rawValue, forKey: "digit")
        }
    }
    //初期化
    init() {
        //動物
        let animalDefault = UserDefaults.standard.string(forKey: "animal") ?? "アルパカ"
        animal = Animal(rawValue: animalDefault) ?? .alpaka
        //読み上げ言語
        let languageDefault = UserDefaults.standard.string(forKey: "language") ?? "日本語"
        language = Language(rawValue: languageDefault) ?? .japanese
        //タップ音
        let soundDefault = UserDefaults.standard.string(forKey: "tapSound") ?? "サウンド1"
        tapSound = TapSound(rawValue: soundDefault) ?? .sound_01
        //入力可能桁数
        let digitDefault = UserDefaults.standard.string(forKey: "digit") ?? "1桁"
        digit = Digit(rawValue: digitDefault) ?? .single
    }
}
