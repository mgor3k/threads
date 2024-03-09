//  Created by Maciej Gorecki on 09/03/2024.

import Foundation

@Observable class ProfileStore {
    let author: Author

    var selectedMenuItem: ProfileMenuItem = .threads {
        didSet {
            switch selectedMenuItem {
            case .threads:
                selectedThreads = threads
            case .replies:
                selectedThreads = replies.shuffled()
            case .reposts:
                selectedThreads = reposts
            }
        }
    }

    let threads: [ThreadStore]
    let replies: [ThreadStore]
    let reposts: [ThreadStore] = []

    var selectedThreads: [ThreadStore] = []

    init(author: Author) {
        self.author = author

        threads = Thread.mocks.map(ThreadStore.init)
        replies = Thread.mocks.map(ThreadStore.init)

        selectedMenuItem = .threads
    }
}
