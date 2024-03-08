//  Created by Maciej Gorecki on 08/03/2024.

import SwiftUI

struct MainView: View {
    var body: some View {
        // TODO: Make custom
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                }

            Color.blue
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }

            Color.yellow
                .tabItem {
                    Image(systemName: "square.and.pencil")
                }

            Color.red
                .tabItem {
                    Image(systemName: "heart")
                }

            Color.green
                .tabItem {
                    Image(systemName: "person")
                }
        }
        .tint(.white)
    }
}

#Preview {
    MainView()
}
