//
//  ContentView.swift
//  CalcApp_okubo
//
//  Created by 大久保徹郎 on 2021/09/29.
//

import SwiftUI

struct ContentView: View {
    //ViewModelのインスタンス
    @ObservedObject private var calcViewModel = CalcViewModel()
    //ボタンに表示するテキストを横一列毎にまとめた多次元配列
    private let buttonStr = [["AC", "+/-", "%", "÷"],
                             ["7", "8", "9", "×"],
                             ["4", "5", "6", "-"],
                             ["1", "2", "3", "+"],
                             ["0", ".", "="]]
    var body: some View {
        ZStack {
            Color(.black)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                //ボタンの入力を反映するテキスト
                Text(calcViewModel.displayText)
                    .font(.system(size: UIScreen.main.bounds.width / 5))
                    .foregroundColor(.white)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                    .padding()
                //２重のForEachで多次元配列の値をからボタンに当てはめて並べる
                ForEach(0..<buttonStr.count, id: \.self) { row in
                    HStack(spacing: 0) {
                        ForEach(0..<buttonStr[row].count, id: \.self) { col in
                            CircleText(calcViewModel: calcViewModel,
                                       text: buttonStr[row][col])
                                .padding(5)
                        }// ForEach col
                    }// HStack
                }// ForEach row
            }// VStack
        }// ZStack
    }// body
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
