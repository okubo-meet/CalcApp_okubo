//
//  CircleText.swift
//  CalcApp_okubo
//
//  Created by 大久保徹郎 on 2021/09/29.
//

import SwiftUI

struct CircleText: View {
    //ContentViewと共有するデータオブジェクト
    @StateObject var calcViewModel: CalcViewModel
    //ボタンのサイズ
    private let buttonSize = CGFloat(UIScreen.main.bounds.height) / 8
    //ボタンのテキスト
    let text: String
    var body: some View {
        if text == "C" || text == "=" {
            //黄色ボタン
            Text(text)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(width: buttonSize * 1.5, height: buttonSize / 1.5)
                .background(Color.buttonYellow)
                .cornerRadius(buttonSize / 1.5)
        } else if text == "+" || text == "-" {
            //点滅する青ボタン(+,-)
            Text(text)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(width: buttonSize, height: buttonSize)
                .background(calcViewModel.isHighlight ? Color.blue : Color.buttonBulue)
                .cornerRadius(buttonSize / 2)
        } else {
            //青ボタン(数字)
            Text(text)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(width: buttonSize, height: buttonSize)
                .background(Color.buttonBulue)
                .cornerRadius(buttonSize / 2)
        }
        
    }// body
}

struct CircleText_Previews: PreviewProvider {
    static var previews: some View {
        CircleText(calcViewModel: CalcViewModel(), text: "1")
    }
}
