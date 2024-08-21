//
//  TabBarView.swift
//  HXD
//
//  Created by Michelle Angela Aryanto on 21/08/24.
//

import SwiftUI

struct TabBarView: View {
    @State private var selectedTab = 0
    @State private var isTabDisabled = true

    init() {
//        UITabBar.appearance().backgroundColor = UIColor.systemBackground
        UITabBar.appearance().unselectedItemTintColor = UIColor.gray
        UITabBar.appearance().tintColor = UIColor.orange
    }

    var body: some View {
        TabView(selection: $selectedTab) {
            HomePage()
                .tabItem {
                    Label {
                        Text("Story")
                            .foregroundStyle(selectedTab == 0 ? Color.orange3 : Color.gray)
                    } icon: {
                        Image("story")
                            .resizable()
                            .renderingMode(/*@START_MENU_TOKEN@*/ .template/*@END_MENU_TOKEN@*/)
                            .foregroundStyle(selectedTab == 0 ? Color.orange3 : Color.gray)
                    }
                }
            // change to pinyin page
            ContentView()
                .tabItem {
                    Label {
                        Text("Pin Yin")
                            .foregroundStyle(selectedTab == 0 ? Color.orange3 : Color.gray)
                    } icon: {
                        Image("pinyin")
                            .resizable()
                            .renderingMode(/*@START_MENU_TOKEN@*/ .template/*@END_MENU_TOKEN@*/)
                            .foregroundStyle(selectedTab == 0 ? Color.orange3 : Color.gray)
                    }
                }
//            ComingSoonView()
//                .tabItem {
//                    Label {
//                        Text("Challenge")
//                            .foregroundStyle(selectedTab == 0 ? Color.orange3 : Color.gray)
//                    } icon: {
//                        Image("challenge")
//                            .resizable()
//                            .renderingMode(/*@START_MENU_TOKEN@*/ .template/*@END_MENU_TOKEN@*/)
//                            .foregroundStyle(selectedTab == 0 ? Color.orange3 : Color.gray)
//                    }
//                }
//                .onAppear {
//                    if isTabDisabled {
//                        selectedTab = 0
//                    }
//                }
//
//            ComingSoonView()
//                .tabItem {
//                    Label {
//                        Text("Profile")
//                            .foregroundStyle(selectedTab == 0 ? Color.orange3 : Color.gray)
//                    } icon: {
//                        Image("profile")
//                            .resizable()
//                            .renderingMode(/*@START_MENU_TOKEN@*/ .template/*@END_MENU_TOKEN@*/)
//                            .foregroundStyle(selectedTab == 0 ? Color.orange3 : Color.gray)
//                    }
//                }
                .disabled(isTabDisabled)
        }
        .tint(.orange3)
    }
}

#Preview {
    TabBarView()
}
