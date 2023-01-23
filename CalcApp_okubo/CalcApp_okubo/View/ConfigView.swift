//
//  ConfigView.swift
//  CalcApp_okubo
//
//  Created by 大久保徹郎 on 2021/11/19.
//

import SwiftUI

struct ConfigView: View {
    //ConfigViewModelの共有インスタンス
    @EnvironmentObject var configViewModel: ConfigViewModel
    //タップ音を再生するクラスのインスタンス
    private let player = SoundPlayer()
    //Formの行の高さ
    private let rowHeight = UIScreen.main.bounds.height / 40
    var body: some View {
            Form {
                // 動物選択
                Picker(selection: $configViewModel.animal,
                       label: Text("動物").font(.system(size: rowHeight))
                ) {
                    ForEach(Animal.allCases, id: \.self) { index in
                        HStack {
                            Image(index.toImageString())
                                .resizable()
                                .scaledToFit()
                                .frame(height: rowHeight)
                            Text(index.rawValue)
                                .font(.system(size: rowHeight))
                        }// HStack
                    }
                }
                .pickerStyle(.navigationLink)
                .tint(.buttonBlue)
                // 言語選択
                Picker(selection: $configViewModel.language,
                       label: Text("言語").font(.system(size: rowHeight))
                ) {
                    ForEach(Language.allCases, id: \.self) { index in
                        Text(index.rawValue)
                            .font(.system(size: rowHeight))
                    }
                }
                .pickerStyle(.navigationLink)
                .tint(.buttonBlue)
                // タップ音選択
                Picker(selection: $configViewModel.tapSound,
                       label: Text("タップ音").font(.system(size: rowHeight))
                ) {
                    ForEach(TapSound.allCases, id: \.self) { index in
                        HStack {
                            //試聴ボタン
                            Button(action: {
                                player.circleTap_play(sound: index.toSoundName())
                            }) {
                                Image(systemName: "speaker.wave.3.fill")
                                    .font(.system(size: rowHeight))
                            }
                            Text(index.rawValue)
                                .font(.system(size: rowHeight))
                        }// HStack
                    }
                }
                .pickerStyle(.navigationLink)
                .tint(.buttonBlue)
                // 桁数選択
                Picker(selection: $configViewModel.digit,
                       label: Text("入力桁数").font(.system(size: rowHeight))
                ) {
                    ForEach(Digit.allCases, id: \.self) { index in
                        Text(index.rawValue)
                            .font(.system(size: rowHeight))
                    }
                }
                .pickerStyle(.navigationLink)
                .tint(.buttonBlue)
            }//  Form
            .navigationTitle("設定")
            .navigationBarTitleDisplayMode(.large)
    }// body
}

struct ConfigView_Previews: PreviewProvider {
    static var previews: some View {
        ConfigView()
            .environmentObject(ConfigViewModel())
    }
}
