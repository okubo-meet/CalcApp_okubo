//
//  CircleText.swift
//  CalcApp_okubo
//
//  Created by 大久保徹郎 on 2021/09/29.
//

import SwiftUI

struct CircleText: View {
    //    @ObservedObject var calcViewModel: CalcViewModel
    //ボタンのサイズ
    private let buttonSize = CGFloat(UIScreen.main.bounds.height) / 8
    //ボタンのテキスト
    let text: String
    var body: some View {
        if text == "AC" || text == "=" {
            //黄色ボタン
            Text(text)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(width: buttonSize * 1.5, height: buttonSize / 1.5)
                .background(Color.buttonYellow)
                .cornerRadius(buttonSize / 1.5)
        } else {
            //青ボタン
            Text(text)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(width: buttonSize, height: buttonSize)
                .background(Color.buttonBulue)
                .cornerRadius(buttonSize / 2)
        }
        
    }// body
    
    //    /// 演算子ボタンが押されているかを返す関数
    //    /// - Returns: ボタンとテキストの色を切り替えるために使う
    //    private func isActiveColor() -> Bool {
    //        //押された演算子ボタンか判定し、トリガーがtrueになっている場合のみ色を切り替える
    //        if calcViewModel.calcOperator.rawValue == text && calcViewModel.isWhite {
    //            return calcViewModel.calcOperator.isActive()
    //        } else {
    //            return false
    //        }
    //    }// isActive
}

struct CircleText_Previews: PreviewProvider {
    static var previews: some View {
        CircleText(text: "1")
    }
}
