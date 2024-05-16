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
        VStack(spacing: 0) {
            if !appState.isFullScreen {
                HStack {
                    HomeTitleButton(selectedTitle: $viewModel.selectedTitle, title: .TANTAN)
                    HomeTitleButton(selectedTitle: $viewModel.selectedTitle, title: .PICKS)
                    Spacer()
                }.padding([.leading, .top], 15)
            }
            
            switchTab()
        }
    }
    
    @ViewBuilder
    func switchTab() -> some View {
        switch viewModel.selectedTitle {
        case .TANTAN:
            if viewModel.hasMoreCard {
                ZStack {
                    ForEach(viewModel.displayingCard.reversed()) { card in
                        CardContainerView(viewModel: viewModel, card: card)
                            .environmentObject(appState)
                    }
                }
            } else {
                NoResultView()
            }
        case .PICKS:
            Text("PICKS")
        }
    }
    
    enum HomeTitle: String {
        case TANTAN
        case PICKS
    }
}

struct HomeTitleButton: View {
    @Binding var selectedTitle: HomeScreen.HomeTitle
    var title: HomeScreen.HomeTitle
    
    var body: some View {
        Button {
            selectedTitle = title
        } label: {
            Text(title.rawValue)
                .font(.system(size: 25))
                .fontWeight(.bold)
                .foregroundColor(selectedTitle == title ? .accentColor : .gray.opacity(0.6))
        }
    }
}

#Preview {
    HomeScreen().environmentObject(AppState())
}
