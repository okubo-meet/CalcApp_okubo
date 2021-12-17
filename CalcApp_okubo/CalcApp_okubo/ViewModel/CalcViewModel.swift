//
//  CalcViewModel.swift
//  CalcApp_okubo
//
//  Created by 大久保徹郎 on 2021/10/07.
//

import UIKit
import SwiftUI
import AVFAudio

class CalcViewModel: NSObject, ObservableObject, AVSpeechSynthesizerDelegate {
    ///計算式の解の文字列
    @Published var answerNumber = ""
    ///演算子前の数値の文字列
    @Published var firstNumber: String = ""
    /// 演算子後の数値の文字列
    @Published var secondNumber: String = ""
    /// 現在有効な演算子
    @Published var calcOperator: Operator = .none
    ///"＋,ー"ボタンの色を切り替えるためのトリガー
    @Published var isHighlight = false
    /// "="と計算結果の表示有無
    @Published var isEqual = false
    ///読み上げ中かの判定
    @Published var speaker: Speaker = .off
    /// 選択中の動物
    @Published var animal: Animal = .alpaka
    /// 選択中の言語
    @Published var language: Language = .japanese
    /// 選択中のタップ音
    @Published var tapSound: TapSound = .sound_01
    /// 入力可能桁数
    @Published var digit: Digit = .single
    ///SpeechManagerクラスのインスタンス
    private let speechManager = SpeechManager()
    /// SoundPlayerクラスのインスタンス
    private let soundPlayer = SoundPlayer()
    /// "＋,ー"ボタンを点滅させるタイマー
    private var blinkingTimer: Timer?
    ///読み上げの回数（５までカウント）
    private var speechCount = 0
    //デリゲート設定
    override init() {
        super.init()
        speechManager.synthesizer.delegate = self
    }
    // MARK: - デリゲートメソッド
    ///読み上げ開始を検知するデリゲートメソッド
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didStart utterance: AVSpeechUtterance) {
        speaker = .on
        speechCount += 1
        print("読み上げ開始: \(speechCount)")
    }
    ///読み上げ終了を検知するデリゲートメソッド
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        //式の解を読み終えたらときに終了の処理
        if speechCount == 5 {
            print("読み上げ終了")
            speaker = .off
            //カウントを０に戻す
            speechCount = 0
        }
    }
    // MARK: - メソッド
    ///条件に応じて=の文字列を返す関数
    func equalString() -> String {
        if isEqual {
            return "="
        } else {
            return ""
        }
    }
    /// 押されたボタンによって呼び出す処理が変える関数
    /// - Parameter text: 押されたボタンのテキスト
    func buttonAction(text: String) {
        //演算子以外の処理
        switch text {
        case "C":
            clearAction()
            soundPlayer.clearSound_play()
        case "+":
            setOperator(text)
            print("足し算")
            soundPlayer.circleTap_play(sound: tapSound.toSoundName())
        case "-":
            setOperator(text)
            print("引き算")
            soundPlayer.circleTap_play(sound: tapSound.toSoundName())
        case "=":
            equalAction()
        default:
            insertNumber(text)
            soundPlayer.circleTap_play(sound: tapSound.toSoundName())
        }
    }
    /// 最初の数字が入力されたら"＋,ー"ボタンを点滅させる関数
    private func buttonBlinking() {
        blinkingTimer?.invalidate()
        //演算子が入力されるまで点滅させるアニメーション
        blinkingTimer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) {_ in
            //演算子が入力されているか、前の項の入力が取り消されたとき
            if self.calcOperator != .none || self.firstNumber == "" {
                //アニメーション停止
                self.blinkingTimer?.invalidate()
                self.isHighlight = false
                print("アニメーション終了")
            } else {
                withAnimation {
                    //色を切り替える
                    self.isHighlight.toggle()
                }
            }
        }// Timer
    }
    /// 数字ボタンを押した時の関数
    private func insertNumber(_ text: String) {
        //前回の計算結果が表示されているとき
        if isEqual {
            //画面をリセット
            allClear()
        }
        //最初の入力なら
        if calcOperator == .none && firstNumber == "" {
            //アニメーション開始
            buttonBlinking()
            print("アニメーション開始")
        }
        //入力可能桁数によって呼び出す関数を変える
        if digit.isDoubleDigit() {
            insertDoubleDigit(text)
        } else {
            insertSingleDigit(text)
        }
    }
    ///1桁のみの入力の関数
    private func insertSingleDigit(_ text: String) {
        //前の項と演算子の入力があるか判定
        if calcOperator.isActive() && firstNumber != "" {
            //演算子が押されているなら後ろの項に代入
            secondNumber = text
        } else {
            //まだ演算子が押されていないなら前の項に代入
            firstNumber = text
        }
    }
    ///2桁まで入力の場合の関数
    private func insertDoubleDigit(_ text: String) {
        //前の項と演算子の入力があるか判定
        if calcOperator.isActive() && firstNumber != "" {
            //既に2桁の入力がされているか、0が入力されているとき
            if secondNumber.count == 2 || secondNumber == "0" {
                //1の位を削除して
                secondNumber.removeLast()
            }
            //入力された数字を加える
            secondNumber += text
        } else {
            if firstNumber.count == 2 || firstNumber == "0" {
                firstNumber.removeLast()
            }
            firstNumber += text
        }
    }
    ///演算子を有効にして画面に表示する関数
    private func setOperator(_ text: String) {
        //前回の計算結果が表示されているとき
        if isEqual {
            //画面をリセット
            allClear()
        }
        //押された演算子をセット
        if let setting = Operator(rawValue: text) {
            calcOperator = setting
        }
    }
    ///ACボタンを押した時の関数
    private func clearAction() {
        if isEqual {
            allClear()
        } else {
            oneBack()
        }
    }
    ///入力欄を一つ戻る関数
    private func oneBack() {
        //後ろの項から参照して1文字ずつ消していく
        if secondNumber != "" {
            secondNumber.removeLast()
        } else if calcOperator != .none {
            calcOperator = .none
            //ボタン点滅アニメーション開始
            buttonBlinking()
            print("アニメーション開始")
        } else if firstNumber != "" {
            firstNumber.removeLast()
        } else {
            print("何も入力されていません")
        }
    }
    ///画面を初期化する関数
    private func allClear() {
        print("オールクリア")
        calcOperator = .none
        answerNumber = ""
        firstNumber = ""
        secondNumber = ""
        isEqual = false
    }
    ///＝ボタンを押した時の関数
    private func equalAction() {
        //全ての入力ができてる時のみ計算開始
        if calcOperator != .none && secondNumber != "" {
            //読み上げ中は処理を行わない
            if speaker == .on {
                print("読み上げ中")
            } else {
                print("計算開始")
                isEqual = true
                calculation(calcOperator)
                soundPlayer.equalSound_play()
            }
        } else {
            //入力が足りないとき
            soundPlayer.clearSound_play()
        }
    }
    ///計算して読み上げる関数
    private func calculation(_ paramOperator: Operator) {
        //計算に使う数値
        var answer = 0
        let first = Int(firstNumber)!
        let second = Int(secondNumber)!
        //計算
        switch paramOperator {
        case .subtraction:
            answer = first - second
        case .addition:
            answer = first + second
        case .none:
            print("計算なし")
        }
        //読み上げ開始
        speechManager.speech_number(num: firstNumber, local: language.local(), animal: animal)
        speech_operator(calcOperator)
        speechManager.speech_number(num: secondNumber, local: language.local(), animal: animal)
        speechManager.speech_equal(language: language, animal: animal)
        //解を画面に表示
        answerNumber = String("\(answer)")
        speechManager.speech_number(num: answerNumber, local: language.local(), animal: animal)
    }
    ///演算子の読み上げ関数を呼び出す関数
    private func speech_operator(_ paramOperator: Operator) {
        //画面に表示されている方を読み上げる
        if paramOperator == .addition {
            //"+"の読み上げ
            speechManager.speech_plus(language: language, animal: animal)
        } else if paramOperator == .subtraction {
            //"-"の読み上げ
            speechManager.speech_minus(language: language, animal: animal)
        }
    }
    
}
