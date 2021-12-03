//
//  ConfigView.swift
//  CalcApp_okubo
//
//  Created by 大久保徹郎 on 2021/11/19.
//

import SwiftUI

struct ConfigView: View {
    private var language = ["日本語", "英語", "中国語"]
    @State var selectLang = 0
    @State var animal: Animal = .alpaka
    var body: some View {
            Form {
                Picker(selection: $selectLang, label: Text("言語")) {
                    ForEach(0..<language.count) { num in
                        Text(language[num])
                    }
                }
                Text("入力桁数")
                Picker(selection: $animal, label: Text("動物")) {
                    ForEach(Animal.allCases, id: \.self) { index in
                        Text(index.rawValue)
                    }
                }
                Text("タップ音")
            }
            
            .navigationTitle("設定")
    }// body
    
    
}

struct ConfigView_Previews: PreviewProvider {
    static var previews: some View {
        ConfigView()
    }
}
