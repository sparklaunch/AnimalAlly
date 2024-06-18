//
//  MainView.swift
//  AnimalAlly
//
//  Created by Jinwook Kim on 6/16/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("홈", systemImage: "house")
                }
            HomeView()
                .tabItem {
                    Label("즐겨찾기", systemImage: "heart")
                }
            HomeView()
                .tabItem {
                    Label("대화", systemImage: "message")
                }
            HomeView()
                .tabItem {
                    Label("프로필", systemImage: "person")
                }
        }
    }
}

#Preview {
    MainView()
}
