//
//  HomeScreen.swift
//  TanTan
//
//  Created by 中律十七 on 2024/5/14.
//

import SwiftUI

struct HomeScreen: View {
    @EnvironmentObject var appState: AppState
    @StateObject var viewModel: HomeViewModel = HomeViewModel()
    
    var body: some View {
        if viewModel.hasMoreCard {
            ZStack {
                ForEach(viewModel.displayingCard.reversed()) { card in
                    CardContainerView(viewModel: viewModel, card: card).environmentObject(appState)
                }
            }
        } else {
            NoResultView()
        }
        
    }
}

#Preview {
    HomeScreen().environmentObject(AppState())
}