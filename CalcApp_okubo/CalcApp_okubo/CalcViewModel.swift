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
                clearText()
            case "+/-":
                print("正負を反転する")
                changeSign()
            case "%":
                print("1/100にする")
                persentAction()
            case ".":
                setDecimalPoint(text)
            default:
                insertNumber(text)
            }
        }
    }
    /// 数字ボタンを押した時の関数
    private func insertNumber(_ text: String) {
        if calcOperator.isActive() {
            //演算子が押されているなら
            if secondNumber == "0" {
                //最初に"0"が入力されているなら新たに入力された値を代入
                secondNumber = text
            } else {
                //後ろの項に数字を追加
                secondNumber += text
            }
            //画面に表示
            displayText = secondNumber
        } else {
            //まだ演算子が押されていないなら
            if firstNumber == "0" {
                //最初に"0"が入力されているなら新たに入力された値を代入
                firstNumber = text
            } else {
                //前の項に数字を追加
                firstNumber += text
            }
            displayText = firstNumber
        }
    }
    ///ACボタンを押した時の関数
    private func clearText() {
        print("オールクリア")
        calcOperator = .equal
        displayText = "0"
        firstNumber = ""
        secondNumber = ""
    }
    ///+/-ボタンのアクション
    private func changeSign() {
        //入力中の数字に"-1"をかける
        let minus = stringToCalc("-1")
        //入力された数字
        var inputNumber: NSDecimalNumber
        //演算子が押されているなら
        if calcOperator.isActive() {
            //後ろの項の処理
            inputNumber = stringToCalc(secondNumber)
            secondNumber = String("\(inputNumber.multiplying(by: minus))")
            displayText = secondNumber
        } else {
            //前の項の処理
            //入力がないとき
            if firstNumber == "" {
                //表示中のテキストを代入
                firstNumber = displayText
            }
            inputNumber = stringToCalc(firstNumber)
            firstNumber = String("\(inputNumber.multiplying(by: minus))")
            displayText = firstNumber
        }
    }
    ///%ボタンを押したときの関数
    private func persentAction() {
        //入力されている数字に0.01をかける
        let persent = NSDecimalNumber(string: "0.01")
        //計算に使う入力された数値
        var num = NSDecimalNumber(string: "0.0")
        //演算子が押されているか判定
        if calcOperator.isActive() {
            if secondNumber == "" {
                print("処理なし")
            } else {
                num = stringToCalc(secondNumber)
                print("計算に使う値：\(num)")
                secondNumber = String("\(num.multiplying(by: persent))")
                displayText = secondNumber
            }
        } else {
            if firstNumber == "" {
                if displayText == "0" {
                    print("処理なし")
                } else {
                    //前回の計算結果が表示されているとき
                    num = stringToCalc(displayText)
                    print("計算に使う値：\(num)")
                }
            } else {
                num = stringToCalc(firstNumber)
                print("計算に使う値：\(num)")
            }
            firstNumber = String("\(num.multiplying(by: persent))")
            displayText = firstNumber
        }
    }
    ///小数点ボタンを押したときの関数
    private func setDecimalPoint(_ text: String) {
        //演算子が押されているか判定
        if calcOperator.isActive() {
            //後ろの項に小数点が付いているか判定
            if pointCheck(secondNumber) {
                print("既に小数点が付いています")
            } else {
                //まだついていないなら
                print("小数点付与")
                if secondNumber == "" {
                    //何も入力されていないなら0に小数点を付与
                    secondNumber = "0."
                } else {
                    //入力された数字に小数点を付与
                    secondNumber += text
                }
                //画面に表示
                displayText = secondNumber
            }
        } else {
            //前の項で同じ処理
            if pointCheck(firstNumber) {
                print("既に小数点が付いています")
            } else {
                print("小数点付与")
                if firstNumber == "" {
                    firstNumber = "0."
                } else {
                    firstNumber += text
                }
                displayText = firstNumber
            }
        }
    }
    ///入力された数字に小数点が含まれているかを返す関数
    private func pointCheck(_ text: String) -> Bool {
        if text.contains(".") {
            print("小数点を含む: \(text)")
            return true
        } else {
            print("小数点を含まない: \(text)")
            return false
        }
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
    ///Double型で計算して結果を表示する関数
    private func calculation(_ paramOperator: Operator) {
        //計算で扱う数値に変換
        let first = NSDecimalNumber(string: firstNumber)
        let second = NSDecimalNumber(string: secondNumber)
        var result = "0.0"
        //有効になっている演算子によって計算が変わる
        switch paramOperator {
        case .divide:
            print("\(first) ÷ \(second)")
            result = String("\(first.dividing(by: second))")
        case .multiply:
            print("\(first) × \(second)")
            result = String("\(first.multiplying(by: second))")
        case .subtraction:
            print("\(first) - \(second)")
            result = String("\(first.subtracting(second))")
        case .addition:
            print("\(first) + \(second)")
            result = String("\(first.adding(second))")
        case .equal:
            print("計算なし")
            result = String("\(first)")
        }
        //計算結果の値を整えて表示する
        displayText = result
    }
    ///入力された数字を正確な計算に使うためにNSDecimalNumberに変換
    private func stringToCalc(_ text: String) -> NSDecimalNumber {
        if text == "" {
            return NSDecimalNumber(string: "0.0")
        } else {
            return NSDecimalNumber(string: text)
        }
    }
}
