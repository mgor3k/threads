//  Created by Maciej Gorecki on 08/03/2024.

import SwiftUI

struct MainView: View {
    @Environment(\.dependencies) var dependencies

    var body: some View {
        // TODO: Make custom
        TabView {
            ThreadsView(
                store: .init(
                    provider: dependencies.threadsProvider
                )
            )
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
