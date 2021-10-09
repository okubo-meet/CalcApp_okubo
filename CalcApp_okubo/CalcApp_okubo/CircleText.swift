//
//  CircleText.swift
//  CalcApp_okubo
//
//  Created by 大久保徹郎 on 2021/09/29.
//

import SwiftUI

struct CircleText: View {
    @ObservedObject var calcViewModel: CalcViewModel
    //ボタンが押された時の判定
    @Binding var isTapped: Bool
    //ボタンのテキスト
    let text: String
    //ボタンのサイズ
    let buttonSize = CGFloat(UIScreen.main.bounds.width) / 5
    
    var body: some View {
        //textが演算子か判定
        if calcViewModel.isOperator(text: text) {
            //演算子はオレンジ色
            Text(text)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(width: buttonSize, height: buttonSize)
                .background(isTapped ? Color.white : Color.orange)
                .cornerRadius(buttonSize / 2)
                .animation(.default)
        } else if text == "0" {
            //0ボタンのみサイズ横幅を大きくする
            Text(text)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(width: buttonSize * 2 + 10, height: buttonSize)
                .background(isTapped ? Color.white : Color.gray)
                .cornerRadius(buttonSize / 2)
                .animation(.default)
        } else {
            //その他のボタン
            Text(text)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(width: buttonSize, height: buttonSize)
                .background(isTapped ? Color.white : Color.gray)
                .cornerRadius(buttonSize / 2)
                .animation(.default)
        }
    }// body
}

struct CircleText_Previews: PreviewProvider {
    static var previews: some View {
        CircleText(calcViewModel: CalcViewModel(), isTapped: .constant(false), text: "1")
    }
}
