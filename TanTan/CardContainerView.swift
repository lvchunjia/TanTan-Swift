//
//  CardContainerView.swift
//  TanTan
//
//  Created by 中律十七 on 2024/5/15.
//

import SwiftUI

struct CardContainerView: View {
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ForEach(viewModel.displayingCard.reversed()) { card in
                UserCardView(userCard: card, swipeAction: viewModel.nextUserCard)
            }
            
            if viewModel.hasMoreCard {
                HStack {
                    ForEach(ButtonType.allCases) { type in
                        RoundButton(type: type)
                            .frame(height: 45)
                    }
                }.padding(.bottom, 15)
            }
           
        }.padding(.horizontal, 20).padding(.vertical, 50)
    }
}

#Preview {
    CardContainerView(viewModel: HomeViewModel())
}
