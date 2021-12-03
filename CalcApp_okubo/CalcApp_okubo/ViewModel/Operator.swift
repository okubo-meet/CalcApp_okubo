//
//  Operator.swift
//  CalcApp_okubo
//
//  Created by 大久保徹郎 on 2021/10/15.
//

import Foundation

enum Operator: String, CaseIterable {
    case subtraction = "-"
    case addition = "+"
    //演算子が押されていない状態
    case none = ""
    
    ///アクティブになっている演算子
    func isActive() -> Bool {
        switch self {
        case .subtraction:
            return true
        case .addition:
            return true
        case .none:
            //入力前、計算終了の状態
            return false
        }
    }
}
