//
//  CircleText.swift
//  CalcApp_okubo
//
//  Created by 大久保徹郎 on 2021/09/29.
//

import SwiftUI

struct CircleText: View {
    //ボタンテキスト
    var text: String
    //ボタンの色
    var color: Color
    
    var body: some View {
        //0ボタンのみサイズ横幅を大きくする
        if text == "0" {
            Text(text)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(width: 160, height: 80)
                .background(Color.gray)
                .cornerRadius(40)
            
        } else {
            Text(text)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(width: 80, height: 80)
                .background(color)
                .cornerRadius(40)
        }
        
        
    }// body
}

struct CircleText_Previews: PreviewProvider {
    static var previews: some View {
        CircleText(text: "1", color: .gray)
    }
}
