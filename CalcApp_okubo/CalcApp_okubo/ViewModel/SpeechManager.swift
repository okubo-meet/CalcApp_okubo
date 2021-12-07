//
//  SpeechManager.swift
//  CalcApp_okubo
//
//  Created by 大久保徹郎 on 2021/11/05.
//

import SwiftUI
import AVFoundation

///入力された数字を喋るクラス
class SpeechManager {
    ///AVSpeechSynthesizerのインスタンス
    private let synthesizer = AVSpeechSynthesizer()
    // MARK: - メソッド
    ///引数に渡された文字列を読み上げる関数
    func speech(text: String, local: String) {
        //読み上げる文字列
        let utterance = AVSpeechUtterance.init(string: text)
        //読み上げのスピード
        utterance.rate = 0.5
        //音声の高さ
        utterance.pitchMultiplier = 1.1
        //日本語音声
        let voice = AVSpeechSynthesisVoice.init(language: local)
        utterance.voice = voice
        synthesizer.speak(utterance)
    }
}
