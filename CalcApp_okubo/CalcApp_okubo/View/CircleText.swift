//
//  CircleText.swift
//  CalcApp_okubo
//
//  Created by 大久保徹郎 on 2021/09/29.
//

import SwiftUI

struct CircleText: View {
    //＋、ーボタンを点滅させるためのトリガー
    @Binding var isHighlight: Bool
    //ボタンのサイズ
    private let buttonSize = CGFloat(UIScreen.main.bounds.height) / 8
    //ボタンのテキスト
    let text: String
    var body: some View {
        if text == "C" || text == "=" {
            //黄色ボタン
            Text(text)
                .font(.system(size: buttonSize / 3))
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(width: buttonSize * 1.5, height: buttonSize / 1.5)
                .background(Color.buttonYellow)
                .cornerRadius(buttonSize / 1.5)
        } else if text == "+" || text == "-" {
            //点滅する青ボタン(+,-)
            Text(text)
                .font(.system(size: buttonSize / 3))
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(width: buttonSize, height: buttonSize)
                .background(isHighlight ? Color.blue : Color.buttonBlue)
                .clipShape(Circle())
        } else {
            //青ボタン(数字)
            Text(text)
                .font(.system(size: buttonSize / 3))
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(width: buttonSize, height: buttonSize)
                .background(Color.buttonBlue)
                .clipShape(Circle())
        }
        
    }// body
}

struct CircleText_Previews: PreviewProvider {
    static var previews: some View {
        CircleText(isHighlight: .constant(false), text: "1")
    }
}
