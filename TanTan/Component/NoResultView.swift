//
//  NoResultView.swift
//  TanTan
//
//  Created by 中律十七 on 2024/5/15.
//

import SwiftUI

struct NoResultView: View {
    var body: some View {
        VStack {
            Image("User1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                .cornerRadius(50)
                .overlay(Circle().stroke(.white, lineWidth: 5))
                .shadow(radius: 1)
                .padding(.bottom, 20)
            
            Text("Ops, There's no one left to swipe on! Whey not try editing your filters?")
                .foregroundStyle(.gray)
                .padding(.horizontal, 50)
                .padding(.bottom, 10)
            
            Button{
                
            } label: {
                Text("Edit Filter")
                    .frame(width: 300, height: 50)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .background(Color.accentColor)
                    .cornerRadius(10)
            }
        }.frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    NoResultView()
}
