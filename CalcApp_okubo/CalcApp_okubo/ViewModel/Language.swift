//
//  Language.swift
//  CalcApp_okubo
//
//  Created by 大久保徹郎 on 2021/11/26.
//

import Foundation
//中国語は扱うのをやめる
enum Language: String, CaseIterable {
    //"ja-JP"
    case japanese = "日本語"
    //"en-US"
    case english = "英語"
    ///読み上げ言語の設定に使う文字列を返す関数
    func local() -> String {
        switch self {
        case .japanese:
            return "ja-JP"
        case .english:
            return "en-US"
        }
    }
    ///"+"の読み方を返す関数
    func plus() -> String {
        switch self {
        case .japanese:
            return "たす"
        case .english:
            return "plus"
        }
    }
    /// "-"の読み方を返す関数
    func minus() -> String {
        switch self {
        case .japanese:
            return "ひく"
        case .english:
            return "minus"
        }
    }
    ///"="の読み方を返す関数
    func equal() -> String {
        switch self {
        case .japanese:
            return "わ"
        case .english:
            return "equals"
        }
    }
}
