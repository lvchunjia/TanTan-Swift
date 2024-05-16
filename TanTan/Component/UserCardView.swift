//
//  UserCardView.swift
//  TanTan
//
//  Created by 中律十七 on 2024/5/14.
//

import SwiftUI

struct UserCardView: View {
    @EnvironmentObject var appState: AppState
    var userCard: UserCard
    var swipeAction: (() -> Void)?
    @State var imageIndex = 0
    @State var offset: CGSize = .zero
    
    var body: some View {
        GeometryReader { proxy in
            let frameWidth = proxy.size.width
            let frameHeight = proxy.size.height
            
            ZStack(alignment: .top) {
                Image(userCard.photos[imageIndex])
                    .resizable()
                    .frame(width: frameWidth, height: frameHeight)
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(appState.isFullScreen ? 0 : 20)
                
                HStack {
                    Rectangle().onTapGesture { undateImageIndex(hasMoreImage: false) }
                    Rectangle().onTapGesture { undateImageIndex(hasMoreImage: true) }
                }.foregroundColor(.white.opacity(0.01))
                
                HStack {
                    ForEach(0..<userCard.photos.count, id: \.self) { imageIndex in
                        RoundedRectangle(cornerRadius: 20)
                            .frame(height: 4)
                            .foregroundColor(self.imageIndex == imageIndex ? .white : .gray.opacity(0.5))
                    }
                }.padding(.top, 10).padding(.horizontal)
                
                if !appState.isFullScreen {
                    VStack {
                        HStack {
                            if offset.width > 0 {
                                createUserCardLabel(title: "LIKE", degree: -20, color: .green)
                                Spacer()
                            } else if offset.width < 0 {
                                Spacer()
                                createUserCardLabel(title: "NOPE", degree: 20, color: .red)
                            }
                        }.padding(.horizontal, 30).padding(.top, 40)
                        
                        Spacer()
                        createUserCardBottomInfo()
                    }
                }
            }
            .offset(offset)
            .scaleEffect(getScaleAmount())
            .rotationEffect(Angle(degrees: getRotateAmount()))
            .gesture(
                DragGesture().onChanged({ value in
                    if !appState.isFullScreen {
                        withAnimation(.easeOut(duration: 0.2)) {
                            offset = value.translation
                        }
                    }
                }).onEnded { value in
                    if !appState.isFullScreen {
                        withAnimation(.easeOut(duration: 0.2)) {
                            let screenCutoff = frameWidth / 2 * 0.8
                            let translation = value.translation.width
                            let checkingStatus = translation > 0 ? translation : -translation
                            
                            if checkingStatus > screenCutoff {
                                offset = CGSize(width: translation > 0 ? frameWidth : -frameWidth, height: value.translation.height)
                                swipeAction?()
                            } else {
                                offset = .zero
                            }
                        }
                    }
                }
            )
        }
    }
    
    func undateImageIndex(hasMoreImage: Bool) {
        let nextIndex = hasMoreImage ? imageIndex + 1 : imageIndex - 1
        imageIndex = min(max(0, nextIndex), userCard.photos.count - 1)
    }
    
    func getScaleAmount() -> CGFloat {
        let max = UIScreen.main.bounds.width / 2
        let currentAmount = abs(offset.width)
        let percentage = currentAmount / max
        return 1.0 - min(percentage, 0.7) * 0.3
    }
    
    func getRotateAmount() -> Double {
        let max = UIScreen.main.bounds.width / 2
        let currentAmount = offset.width
        let percentage = currentAmount / max
        return Double(percentage * 10)
    }
    
    func createUserCardLabel(title: String, degree: Double, color: Color) -> some View {
        Text(title)
            .tracking(3)
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .fontWeight(.bold)
            .padding(.horizontal)
            .foregroundColor(color)
            .overlay(
                RoundedRectangle(cornerRadius: 5).stroke(color, lineWidth: 3)
            )
            .rotationEffect(.degrees(degree))
    }
    
    func createUserCardBottomInfo() -> some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Text("\(userCard.name)，\(userCard.age)")
                    .font(.system(size: 30))
                    .fontWeight(.heavy)
                HStack {
                    Text(userCard.zodiac)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .padding(5)
                        .background(.white.opacity(0.3))
                        .cornerRadius(5)
                    Text(userCard.place)
                }
            }
            Spacer()
            Button {
                appState.isFullScreen = true
            } label: {
                Image(systemName: "info.circle.fill")
                    .font(.system(size: 30))
                    .padding(8)
            }
        }
        .foregroundColor(.white)
        .padding()
        .padding(.bottom, 60)
        .background(LinearGradient(colors: [.black.opacity(0.9), .clear], startPoint: .bottom, endPoint: .top))
        .cornerRadius(20)
        .clipped()
    }
}

#Preview {
    UserCardView(
        userCard: UserCard(name: "Natalia", age: 22, place: "Vadalia NYC", zodiac: "Cancer", photos: ["User1", "User2"])
    ).environmentObject(AppState())
}
