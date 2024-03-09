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
        }
    }
}
