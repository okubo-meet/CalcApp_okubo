//
//  Language.swift
//  CalcApp_okubo
//
//  Created by 大久保徹郎 on 2021/11/26.
//

import Foundation

enum Language: String, CaseIterable {
    //"ja-JP"
    case japanese = "日本語"
    //"en-US"
    case english = "英語"
    //"zh_CN"
    case chinese = "中国語"
    ///読み上げ言語の設定に使う文字列を返す関数
    func local() -> String {
        switch self {
        case .japanese:
            return "ja-JP"
        case .english:
            return "en-US"
        case .chinese:
            return "zh_CN"
        }
    }
}
