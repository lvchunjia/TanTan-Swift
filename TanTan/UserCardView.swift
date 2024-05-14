//
//  UserCardView.swift
//  TanTan
//
//  Created by 中律十七 on 2024/5/14.
//

import SwiftUI

struct UserCardView: View {
    var userCard: UserCard
    @State var imageIndex = 0
    
    var body: some View {
        GeometryReader { proxy in
            let frameWidth = proxy.size.width
            let frameHeight = proxy.size.height
            
            Image(userCard.photos[imageIndex])
                .resizable()
                .frame(width: frameWidth, height: frameHeight)
                .aspectRatio(contentMode: .fit)
                .cornerRadius(20)
            
            HStack {
                Rectangle()
                    .onTapGesture {
                        undateImageIndex(hasMoreImage: false)
                    }
                
                Rectangle()
                    .onTapGesture {
                        undateImageIndex(hasMoreImage: true)
                    }
            }.foregroundColor(.white.opacity(0.01))
            
            HStack {
                ForEach(0..<userCard.photos.count, id: \.self) { imageIndex in
                    RoundedRectangle(cornerRadius: 20)
                        .frame(height: 4)
                        .foregroundColor(self.imageIndex == imageIndex ? .white : .gray.opacity(0.5))
                }
            }.padding(.top, 10).padding(.horizontal)
        }
    }
    
    func undateImageIndex(hasMoreImage: Bool) {
        let nextIndex = hasMoreImage ? imageIndex + 1 : imageIndex - 1
        imageIndex = min(max(0, nextIndex), userCard.photos.count - 1)
        
    }
}

#Preview {
    UserCardView(userCard: UserCard(
            name: "Natalia", age: 22, place: "Vadalia NYC", zodiac: "Cancer", photos: ["User1", "User2"]
    ))
}
