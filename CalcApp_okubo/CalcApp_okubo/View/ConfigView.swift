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
    var body: some View {
            Form {
                Picker(selection: $configViewModel.animal, label: Text("動物")) {
                    ForEach(Animal.allCases, id: \.self) { index in
                        HStack {
                            Image(index.toImageString())
                                .resizable()
                                .scaledToFit()
                                .frame(height: 35)
                            Text(index.rawValue)
                        }// HStack
                    }
                }
                Picker(selection: $configViewModel.language, label: Text("言語")) {
                    ForEach(Language.allCases, id: \.self) { index in
                        Text(index.rawValue)
                    }
                }
                Picker(selection: $configViewModel.tapSound, label: Text("タップ音")) {
                    ForEach(TapSound.allCases, id: \.self) { index in
                        HStack {
                            //試聴ボタン
                            Button(action: {
                                player.circleTap_play(sound: index.toSoundName())
                            }) {
                                Image(systemName: "speaker.wave.3.fill")
                            }
                            Text(index.rawValue)
                        }// HStack
                    }
                }
                Picker(selection: $configViewModel.digit, label: Text("入力桁数")) {
                    ForEach(Digit.allCases, id: \.self) { index in
                        Text(index.rawValue)
                    }
                }
            }
            
            .navigationTitle("設定")
    }// body
    
    
}

struct ConfigView_Previews: PreviewProvider {
    static var previews: some View {
        ConfigView()
    }
}
