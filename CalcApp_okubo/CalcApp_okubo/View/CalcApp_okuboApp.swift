//
//  CalcApp_okuboApp.swift
//  CalcApp_okubo
//
//  Created by 大久保徹郎 on 2021/09/29.
//

import SwiftUI

@main
struct CalcApp_okuboApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(CalcViewModel())
        }
    }
}
