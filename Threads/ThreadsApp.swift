//  Created by Maciej Gorecki on 08/03/2024.

import SwiftUI

@main
struct ThreadsApp: App {
    let dependencies = Dependencies(
        imageFetcher: .live(
            imageCache: .init(),
            urlSession: .shared
        ),
        threadsProvider: .mock(
            delay: nil
        )
    )

    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.dependencies, dependencies)
                .onAppear {
                    configureNavigationBar()
                }
        }
    }

    func configureNavigationBar() {
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithOpaqueBackground()
        navigationBarAppearance.shadowColor = .clear

        UINavigationBar.appearance().standardAppearance = navigationBarAppearance
        UINavigationBar.appearance().compactAppearance = navigationBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
    }
}
