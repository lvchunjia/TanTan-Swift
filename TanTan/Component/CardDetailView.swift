//
//  CasrDetailView.swift
//  TanTan
//
//  Created by 中律十七 on 2024/5/15.
//

import SwiftUI

struct CardDetailView: View {
    var card: UserCard
    
    var body: some View {
        let screen = UIScreen.main.bounds
        
        ScrollView(showsIndicators: false) {
            VStack(spacing: 0) {
                UserCardView(userCard: card, isFullScreen: true)
                    .frame(width: screen.width, height: screen.height * 0.7)
                
                HStack {
                    VStack(alignment: .leading) {
                        HStack {
                            Text(card.name).font(.system(size: 32, weight: .bold))
                            Text("\(card.age)").font(.system(size: 28, weight: .light))
                            Spacer()
                        }
                        Text(card.place)
                            .font(.system(size: 18, weight: .light))
                            .foregroundStyle(.gray)
                    }.padding([.top, .horizontal], 20)
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "arrow.up.circle.fill")
                            .font(.system(size: 40))
                            .background(.white)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    }.padding(.trailing, 30).offset(y: -40)
                }
                
                Spacer(minLength: 20)
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
                    .font(.system(size: 18, weight: .medium))
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                    .padding(.horizontal, 20)
                
                Spacer(minLength: 20)
                VStack(spacing: 20) {
                    Button {} label: {
                        VStack(spacing: 8) {
                            Text("SHARE \(card.name.uppercased())'S PROFILE")
                                .font(.system(size: 16, weight: .medium))
                            Text("SEE WHAT A FRIEND THINKS")
                                .font(.system(size: 14, weight: .medium))
                        }
                    }
                    
                    Button {} label: {
                        VStack(spacing: 10) {
                            Text("REPORT \(card.name.uppercased())")
                                .font(.system(size: 18, weight: .medium))
                                .foregroundColor(.black)
                                .opacity(0.75)
                        }
                    }
                    Spacer(minLength: 200)
                }
            }
        }
    }
}

#Preview {
    CardDetailView(card: UserCard(name: "Natalia", age: 22, place: "Vadalia NYC", zodiac: "Cancer", photos: ["User1", "User2"]))
}
