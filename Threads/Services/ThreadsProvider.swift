//  Created by Maciej Gorecki on 08/03/2024.

import Foundation

struct ThreadsProvider {
    let fetchThreads: () async throws -> [Thread]
}

extension ThreadsProvider {
    static var live: Self {
        .init(
            fetchThreads: {
                Thread.mocks
            }
        )
    }
}
