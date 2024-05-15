//
//  HomeScreen.swift
//  TanTan
//
//  Created by 中律十七 on 2024/5/14.
//

import SwiftUI

struct HomeScreen: View {
    @StateObject var viewModel: HomeViewModel = HomeViewModel()
    
    var body: some View {
        CardContainerView(viewModel: viewModel)
    }
}

#Preview {
    HomeScreen()
}
