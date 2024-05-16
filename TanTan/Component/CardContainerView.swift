//
//  CardContainerView.swift
//  TanTan
//
//  Created by 中律十七 on 2024/5/15.
//

import SwiftUI

struct CardContainerView: View {
    @EnvironmentObject var appState: AppState
    @ObservedObject var viewModel: HomeViewModel
    var card: UserCard
    
    var body: some View {
        if appState.isFullScreen {
            CardDetailView(card: card)
                .background(.white)
                .environmentObject(appState)
        } else {
            ZStack(alignment: .bottom) {
                UserCardView(userCard: card, swipeAction: viewModel.nextUserCard).environmentObject(appState)
                
                if viewModel.hasMoreCard {
                    HStack {
                        ForEach(ButtonType.allCases) { type in
                            RoundButton(type: type, action: {
                                switch type {
                                case .back:
                                    debugPrint("Roll Back")
                                case .no:
                                    viewModel.nextUserCard()
                                case .heart:
                                    viewModel.nextUserCard()
                                case .star:
                                    debugPrint("Super Like")
                                }
                            }).frame(height: 45)
                        }
                    }.padding(.bottom, 15)
                }
            }.padding(.horizontal, 20).padding(.vertical, 50)
        }
    }
}

#Preview {
    CardContainerView(viewModel: HomeViewModel(), card: UserCard(name: "Natalia", age: 22, place: "Vadalia NYC", zodiac: "Cancer", photos: ["User1", "User2"]))
        .environmentObject(AppState())
}
