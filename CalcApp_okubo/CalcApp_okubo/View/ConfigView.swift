//
//  ConfigView.swift
//  CalcApp_okubo
//
//  Created by 大久保徹郎 on 2021/11/19.
//

import SwiftUI

struct ConfigView: View {
    //CalcViewModelの共有インスタンス
    @EnvironmentObject var calcViewModel: CalcViewModel
    
    var body: some View {
            Form {
                Picker(selection: $calcViewModel.language, label: Text("言語")) {
                    ForEach(Language.allCases, id: \.self) { index in
                        Text(index.rawValue)
                    }
                }
                Picker(selection: $calcViewModel.digit, label: Text("入力桁数")) {
                    ForEach(Digit.allCases, id: \.self) { index in
                        Text(index.rawValue)
                    }
                }
                Picker(selection: $calcViewModel.animal, label: Text("動物")) {
                    ForEach(Animal.allCases, id: \.self) { index in
                        Text(index.rawValue)
                    }
                }
                Picker(selection: $calcViewModel.tapSound, label: Text("タップ音")) {
                    ForEach(TapSound.allCases, id: \.self) { index in
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
