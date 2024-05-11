//
//  ContentView.swift
//  TanTan
//
//  Created by 中律十七 on 2024/5/11.
//

import SwiftUI

struct ContentView: View {
    var tabs: [TabBarItem] = [
        TabBarItem(title: "TanTan",icon: "rectangle.fill.on.rectangle.fill"),
        TabBarItem(title: "Live",icon: "play.tv.fill"),
        TabBarItem(title: "Message",icon: "message.fill"),
        TabBarItem(title: "Person",icon: "person.fill"),
    ]
    
    @State var selectedTab: TabBarItem = TabBarItem(title: "TanTan",icon: "rectangle.fill.on.rectangle.fill")
    
    var body: some View {
        VStack {
            Spacer()
            
            HStack {
                ForEach (tabs, id: \.self) { tab in
                    createTabBarItem(tabBarItem: tab)
                        .onTapGesture {
                            selectedTab = tab
                        }
                }
            }
        }
        
    }
    
    func createTabBarItem(tabBarItem: TabBarItem) -> some View {
        VStack {
            Image(systemName: tabBarItem.icon)
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(selectedTab == tabBarItem ? .accentColor : Color.gray.opacity(0.5))
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            Text(tabBarItem.title)
                .font(.system(size: 10))
                .foregroundColor(selectedTab == tabBarItem ? .accentColor : Color.gray.opacity(0.5))
        }
    }
}

struct TabBarItem: Hashable {
    let title: String
    let icon: String
}

#Preview {
    ContentView()
}
