//  Created by Maciej Gorecki on 08/03/2024.

import Foundation

@Observable class ThreadsStore {
    enum State {
        case loading
        case loaded([Thread])
        case failure(Error)
    }

    private let provider: ThreadsProvider

    var state: State = .loading

    init(provider: ThreadsProvider) {
        self.provider = provider
    }

    func initialFetch() {
        state = .loading

        Task { @MainActor in
            do {
                let threads = try await provider.fetchThreads()
                state = .loaded(threads)
            } catch {
                state = .failure(error)
            }
        }
    }
}
