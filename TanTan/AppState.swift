//
//  AppState.swift
//  TanTan
//
//  Created by 中律十七 on 2024/5/11.
//

import Foundation

class AppState: ObservableObject {
    @Published var selectedTab: TabItem
    @Published var isFullScreen: Bool
    @Published var isPremium: Bool
    
    init(selectedTab: TabItem = .home, isFullScreen: Bool = false, isPremium: Bool = false) {
        self.selectedTab = selectedTab
        self.isFullScreen = isFullScreen
        self.isPremium = isPremium
    }
}
