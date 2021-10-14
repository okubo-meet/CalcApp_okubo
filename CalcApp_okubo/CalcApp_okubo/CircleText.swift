//
//  CircleText.swift
//  CalcApp_okubo
//
//  Created by 大久保徹郎 on 2021/09/29.
//

import SwiftUI

struct CircleText: View {
    @ObservedObject var calcViewModel: CalcViewModel
    //ボタンのサイズ
    private let buttonSize = CGFloat(UIScreen.main.bounds.width) / 5
    //ボタンのテキスト
    let text: String
    var body: some View {
        //textが演算子か判定
        if calcViewModel.isOperator(text: text) {
            //演算子ボタン
            Button(action: {
                print(text)
            }) {
                //演算子はオレンジ色 計算機能を作るときに色の切り替えも実装する
                Text(text)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(width: buttonSize, height: buttonSize)
                    .background(Color.orange)
                    .cornerRadius(buttonSize / 2)
                    .animation(.default)
            }
        } else if text == "0" {
            //0ボタン
            Button(action: {
                print(text)
            }) {
                //0ボタンのみサイズ横幅を大きくする
                Text(text)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(width: buttonSize * 2 + 10, height: buttonSize)
                    .background(Color.gray)
                    .cornerRadius(buttonSize / 2)
                    .animation(.default)
            }
        } else {
            //その他のボタン
            Button(action: {
                print(text)
            }) {
                Text(text)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(width: buttonSize, height: buttonSize)
                    .background(Color.gray)
                    .cornerRadius(buttonSize / 2)
                    .animation(.default)
            }
        }
    }// body
}

struct CircleText_Previews: PreviewProvider {
    static var previews: some View {
        CircleText(calcViewModel: CalcViewModel(), text: "1")
    }
}
