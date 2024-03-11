//  Created by Maciej Gorecki on 08/03/2024.

import SwiftUI

struct MainView: View {
    @State var previousTab: Tab = .home
    @State var selectedTab: Tab = .home

    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                }
                .tag(Tab.home)

            Color.blue
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
                .tag(Tab.search)

            Color.yellow
                .tabItem {
                    Image(systemName: "square.and.pencil")
                }
                .tag(Tab.newPost)

            Color.red
                .tabItem {
                    Image(systemName: "heart")
                }
                .tag(Tab.favorites)

            Color.green
                .tabItem {
                    Image(systemName: "person")
                }
                .tag(Tab.profile)
        }
        .tint(.white)
        .onChange(of: selectedTab) {
            if selectedTab == Tab.newPost {
                selectedTab = previousTab
                return
            }

            previousTab = selectedTab
        }
    }
}

#Preview {
    MainView()
}
