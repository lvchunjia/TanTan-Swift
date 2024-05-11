//
//  ContentView.swift
//  TanTan
//
//  Created by 中律十七 on 2024/5/11.
//

import SwiftUI

struct ContentView: View {
    @State var selectedTab: TabItem = .home
    
    var body: some View {
        VStack {
            switch selectedTab {
            case .home:
                Text("Home")
            case .live:
                Text("Live")
            case .message:
                Text("Message")
            case .profile:
                Text("Progile")
            }
            
            Spacer()
            
            HStack {
                createTabBarItem(tab: .home, title: "Home")
                createTabBarItem(tab: .live, title: "Live")
                createTabBarItem(tab: .message, title: "Message")
                createTabBarItem(tab: .profile, title: "Profile")
            }
        }
    }
    
    func createTabBarItem(tab: TabItem, title: String) -> some View {
        Button {
            selectedTab = tab
        } label: {
            VStack {
                Image(systemName: tab.rawValue)
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(selectedTab == tab ? .accentColor : Color.gray.opacity(0.5))
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                Text(title)
                    .font(.system(size: 10))
                    .foregroundColor(selectedTab == tab ? .accentColor : Color.gray.opacity(0.5))
            }
        }
        
    }
}

enum TabItem: String {
    case home = "rectangle.fill.on.rectangle.fill"
    case live = "play.tv.fill"
    case message = "message.fill"
    case profile = "person.fill"
}

#Preview {
    ContentView()
}
