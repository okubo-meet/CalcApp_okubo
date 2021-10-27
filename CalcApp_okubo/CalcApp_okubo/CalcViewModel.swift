//
//  CalcViewModel.swift
//  CalcApp_okubo
//
//  Created by 大久保徹郎 on 2021/10/07.
//

import UIKit
import SwiftUI

class CalcViewModel: ObservableObject {
    ///入力結果の文字列
    @Published var displayText: String = "0"
    /// 現在有効な演算子
    @Published var calcOperator: Operator = .equal
    ///演算子ボタンを白に切り替えるトリガー
    @Published var isWhite = false
    ///演算子を押す前に入力された数値の文字列
    private var firstNumber: String = ""
    /// 演算子を押した後に入力された数値の文字列
    private var secondNumber: String = ""
    
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
        //演算子が押された場合
        if isOperator(text: text) {
            setOperator(Operator(rawValue: text)!)
        } else {
            //演算子以外の処理
            switch text {
            case "AC":
                print("オールクリア")
                clearText()
            case "+/-":
                print("正負を反転する")
            case "%":
                print("1/100にする")
            case ".":
                print("小数点付与")
            default:
                insertNumber(text)
            }
        }
    }
    /// 数字ボタンを押した時の関数
    private func insertNumber(_ text: String) {
        if calcOperator.isActive() {
            //演算子が押されているなら後ろの項に数字を足して表示
            secondNumber += text
            displayText = secondNumber
        } else {
            //まだ演算子が押されていないなら前の項に数字を足して表示
            firstNumber += text
            displayText = firstNumber
        }
    }
    ///ACボタンを押した時の関数
    private func clearText() {
        calcOperator = .equal
        displayText = "0"
        firstNumber = ""
        secondNumber = ""
    }
    ///演算子ボタンを押した時の処理
    private func setOperator(_ paramOperator:Operator) {
        //入力された数字がない状態で演算子ボタンが押されたとき
        if firstNumber == "" {
            //現在表示中の数字を計算に使う
            firstNumber = displayText
            print("firsにt代入された値：\(firstNumber)")
        }
        //＝ボタンが押されたとき
        if paramOperator == .equal {
            //２つ目の数字が入力されていないとき
            if secondNumber == "" {
                //最初の数字と同じ値を代入
                secondNumber = firstNumber
                print("secondに代入された値：\(secondNumber)")
            }
            //保持している演算子で計算
            calculation(calcOperator)
            //入力状態をリセット
            calcOperator = .equal
            firstNumber = ""
            secondNumber = ""
        } else {
            //他の演算子ボタンの処理
            //既に二つ目の数字が入力されている場合
            if secondNumber != "" {
                //これまでの入力状況で計算
                calculation(calcOperator)
                //計算結果を前の項として扱う
                firstNumber = displayText
                //後ろの項をリセット
                secondNumber = ""
            }
            //押された演算子を保持
            calcOperator = paramOperator
            //ボタンを白くする
            isWhite = true
        }
    }
    ///計算結果を表示する関数
    private func calculation(_ paramOperator: Operator) {
        //Intに変換された数値
        let first = stringToInt(firstNumber)
        let second = stringToInt(secondNumber)
        var result = 0
        //有効になっている演算子によって計算が変わる
        switch paramOperator {
        case .divide:
            result = first / second
        case .multiply:
            result = first * second
        case .subtraction:
            result = first - second
        case .addition:
            result = first + second
        case .equal:
            print("計算なし")
            result = first
        }
        displayText = String(result)
    }
    ///入力された数字を計算に使うためにIntに変換（後でDoubleへの変換も作る）
    private func stringToInt(_ text: String) -> Int {
        if let num = Int(text) {
            return num
        } else {
            //入力がない
            return 0
        }
    }
}
