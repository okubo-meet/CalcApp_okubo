//
//  ConfigViewModel.swift
//  CalcApp_okubo
//
//  Created by 大久保徹郎 on 2021/11/25.
//

import UIKit
import SwiftUI

class ConfigViewModel: ObservableObject {
    /// 現在選択中の動物
    @Published var animal: Animal = .alpaka
    
}
