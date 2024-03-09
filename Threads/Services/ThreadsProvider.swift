//  Created by Maciej Gorecki on 08/03/2024.

import Foundation

struct ThreadsProvider {
    let fetchThreads: () async throws -> [Thread]
}

extension ThreadsProvider {
    static func mock(delay: Duration? = nil) -> Self {
        .init(
            fetchThreads: {
                if let delay {
                    try await Task.sleep(for: delay)
                }

                return Thread.mocks
            }
        )
    }
}
