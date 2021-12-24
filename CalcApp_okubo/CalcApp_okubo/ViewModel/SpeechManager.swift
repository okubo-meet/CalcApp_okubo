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
    let synthesizer = AVSpeechSynthesizer()
    // MARK: - メソッド
    ///数字を読み上げる関数
    func speech_number(num: String, local: String, animal: Animal) {
        //読み上げる文字列
        let utterance = AVSpeechUtterance.init(string: num)
        //読み上げのスピード
        utterance.rate = animal.rate()
        //音声の高さ
        utterance.pitchMultiplier = animal.pitch()
        //日本語音声
        let voice = AVSpeechSynthesisVoice.init(language: local)
        utterance.voice = voice
        synthesizer.speak(utterance)
    }
    ///"+"を読み上げる関数
    func speech_plus(language: Language, animal: Animal) {
        //読み上げる文字列
        let utterance = AVSpeechUtterance.init(string: language.plus())
        //読み上げのスピード
        utterance.rate = animal.rate()
        //音声の高さ
        utterance.pitchMultiplier = animal.pitch()
        //日本語音声
        let voice = AVSpeechSynthesisVoice.init(language: language.local())
        utterance.voice = voice
        synthesizer.speak(utterance)
    }
    ///"-"を読み上げる関数
    func speech_minus(language: Language, animal: Animal) {
        //読み上げる文字列
        let utterance = AVSpeechUtterance.init(string: language.minus())
        //読み上げのスピード
        utterance.rate = animal.rate()
        //音声の高さ
        utterance.pitchMultiplier = animal.pitch()
        //日本語音声
        let voice = AVSpeechSynthesisVoice.init(language: language.local())
        utterance.voice = voice
        synthesizer.speak(utterance)
    }
    ///"="を読み上げる関数
    func speech_equal(language: Language, animal: Animal) {
        //読み上げる文字列
        let utterance = AVSpeechUtterance.init(string: language.equal())
        //読み上げのスピード
        utterance.rate = animal.rate()
        //音声の高さ
        utterance.pitchMultiplier = animal.pitch()
        //日本語音声
        let voice = AVSpeechSynthesisVoice.init(language: language.local())
        utterance.voice = voice
        synthesizer.speak(utterance)
    }
}
