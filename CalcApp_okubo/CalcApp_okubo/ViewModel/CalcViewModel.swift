//
//  CalcViewModel.swift
//  CalcApp_okubo
//
//  Created by 大久保徹郎 on 2021/10/07.
//

import UIKit
import SwiftUI

class CalcViewModel: ObservableObject {
    ///計算式の解の文字列
    @Published var answerNumber = ""
    ///演算子前の数値の文字列
    @Published var firstNumber: String = ""
    /// 演算子後の数値の文字列
    @Published var secondNumber: String = ""
    /// 現在有効な演算子
    @Published var calcOperator: Operator = .none
    /// "="と計算結果の表示有無
    @Published var isEqual = false
    ///演算子ボタンを白に切り替えるトリガー
    @Published var isWhite = false
    ///SpeechManagerクラスのインスタンス
    private let speechManager = SpeechManager()
    /// SoundPlayerクラスのインスタンス
    private let soundPlayer = SoundPlayer()
    // MARK: - メソッド
    /// 演算子かどうか判定する関数
    /// - Parameter text: ボタンのテキスト
    /// - Returns: 判定結果
    func isOperator(text: String) -> Bool {
        //引数がOperatorのrawValueに含まれているかの判定を返す
        let operators = Operator.allCases.map { $0.rawValue }
        return operators.contains(text)
    }
    /// 押されたボタンによって呼び出す処理が変える関数
    /// - Parameter text: 押されたボタンのテキスト
    func buttonAction(text: String) {
        //ボタンが押されたら白くなってるボタンが元に戻る
        isWhite = false
        //演算子以外の処理
        switch text {
        case "AC":
            clearText()
            soundPlayer.clearSound_play()
        case "+":
            calcOperator = .addition
            print("足し算")
            soundPlayer.circleTap_play(index: 1)
        case "-":
            calcOperator = .subtraction
            print("引き算")
            soundPlayer.circleTap_play(index: 2)
        case "=":
            if calcOperator == .none {
                //演算子が表示されていないとき
            } else {
                print("計算開始")
                isEqual = true
                calculation(calcOperator)
                soundPlayer.equalSound_play()
            }
        default:
            insertNumber(text)
            soundPlayer.circleTap_play(index: 0)
        }
    }
    /// 数字ボタンを押した時の関数
    private func insertNumber(_ text: String) {
        if calcOperator.isActive() {
            //演算子が押されているなら後ろの項に代入
            secondNumber = text
        } else {
            //まだ演算子が押されていないなら前の項に代入
            firstNumber = text
        }
    }
    ///ACボタンを押した時の関数
    private func clearText() {
        print("オールクリア")
        calcOperator = .none
        answerNumber = ""
        firstNumber = ""
        secondNumber = ""
        isEqual = false
    }
    ///＝ボタンを押した時の関数
    private func calculation(_ paramOperator: Operator) {
        var answer = 0
        let first = Int(firstNumber)!
        let second = Int(secondNumber)!
        switch paramOperator {
        case .subtraction:
            answer = first - second
        case .addition:
            answer = first + second
        case .none:
            print("計算なし")
        }
        speechManager.speech(text: firstNumber)
        speechManager.speech(text: paramOperator.rawValue)
        speechManager.speech(text: secondNumber)
        speechManager.speech(text: "=")
        answerNumber = String("\(answer)")
        speechManager.speech(text: answerNumber)
    }
    ///条件に応じて=の文字列を返す関数
    func equalString() -> String {
        if isEqual {
            return "="
        } else {
            return ""
        }
    }
}
