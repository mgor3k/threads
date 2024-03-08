//  Created by Maciej Gorecki on 08/03/2024.

import Foundation
import SwiftUI

struct Dependencies {
    let imageFetcher: ImageFetcher
    let threadsProvider: ThreadsProvider
}

private struct DependenciesKey: EnvironmentKey {
    static let defaultValue: Dependencies = .init(
        imageFetcher: .init(fetch: { _ in UIImage() }),
        threadsProvider: .init(fetchThreads: { [] })
    )
}

extension EnvironmentValues {
    var dependencies: Dependencies {
        get { self[DependenciesKey.self] }
        set { self[DependenciesKey.self] = newValue }
    }
}
