//
//  CasrDetailView.swift
//  TanTan
//
//  Created by 中律十七 on 2024/5/15.
//

import SwiftUI

struct CardDetailView: View {
    @EnvironmentObject var appState: AppState
    var namespace: Namespace.ID
    var card: UserCard
    
    var body: some View {
        let screen = UIScreen.main.bounds
        
        ZStack(alignment: .bottom) {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 0) {
                    UserCardView(userCard: card)
                        .animation(.easeOut(duration: 0.1))
                        .matchedGeometryEffect(id: card.id, in: namespace)
                        .environmentObject(appState)
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
                            withAnimation(.easeOut(duration: 0.1)) {
                                appState.isFullScreen = false
                            }
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
                        Button {
                            showActionSheet()
                        } label: {
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
            
            HStack(spacing: 20) {
                RoundButton(type: .no)
                RoundButton(type: .star)
                RoundButton(type: .heart)
            }
            .frame(height: 45)
            .frame(maxWidth: .infinity)
            .padding(.bottom, 45)
            .background(LinearGradient(gradient: Gradient(colors: [.white.opacity(0.2), .white]), startPoint: .top, endPoint: .bottom))
        }.edgesIgnoringSafeArea(.bottom)
    }
    
    func showActionSheet() {
        let item = ["What do you think about \(card.name)?"]
        let av = UIActivityViewController(activityItems: item, applicationActivities: nil)
        
        // UIApplication.shared.windows.first?.rootViewController?.present(av, animated: true)
        // 获取当前活动的窗口场景
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = windowScene.windows.first {
            window.rootViewController?.present(av, animated: true)
        }
    }
}

//#Preview {
//    @Namespace var namespace
//    CardDetailView(
//        namespace: namespace,
//        card: UserCard(name: "Natalia", age: 22, place: "Vadalia NYC", zodiac: "Cancer", photos: ["User1", "User2"])
//    ).environmentObject(AppState(isFullScreen: true))
//}

struct CardDetailView_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        CardDetailView(
            namespace: namespace,
            card: UserCard(name: "Natalia", age: 22, place: "Vadalia NYC", zodiac: "Cancer", photos: ["User1", "User2"])
        ).environmentObject(AppState(isFullScreen: true))
    }
}
