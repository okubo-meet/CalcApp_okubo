//
//  CalcViewModel.swift
//  CalcApp_okubo
//
//  Created by 大久保徹郎 on 2021/10/07.
//

import UIKit
import SwiftUI

class CalcViewModel: ObservableObject {
    
    
    /// 演算子かどうか判定する関数
    /// - Parameter text: ボタンのテキスト
    /// - Returns: 判定結果
    func isOperator(text: String) -> Bool {
        //引数がこの配列列に含まれているかの判定を消す
        let operators = ["+", "-", "×", "÷", "="]
        return operators.contains(text)
    }// isOperator
    
    
}
