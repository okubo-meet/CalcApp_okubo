//
//  Digit.swift
//  CalcApp_okubo
//
//  Created by 大久保徹郎 on 2021/12/03.
//

import Foundation

enum Digit: String, CaseIterable {
    case single = "1桁"
    case double = "2桁"
    ///2桁の入力を受け付けるかを返す関数
    func isDoubleDigit() -> Bool {
        switch self {
        case .single:
            return false
        case .double:
            return true
        }
    }
}
