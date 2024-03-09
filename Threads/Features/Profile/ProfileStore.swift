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
        replies = [
            .init(thread: .init(id: "68", author: .Mock.apple, creationDate: Date().addingTimeInterval(-200), body: " opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing", media: .image(URL(string: "https://picsum.photos/id/100/200/300")!), isLiked: false, likeCount: 100)),
            .init(thread: .init(id: "69", author: .Mock.apple, creationDate: Date().addingTimeInterval(-200), body: " opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident", media: nil, isLiked: false, likeCount: 100)),
            .init(thread: .init(id: "70", author: .Mock.apple, creationDate: Date().addingTimeInterval(-200), body: "Some body", media: nil, isLiked: false, likeCount: 100)),
            .init(thread: .init(id: "71", author: .Mock.apple, creationDate: Date().addingTimeInterval(-200), body: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it ", media: nil, isLiked: false, likeCount: 100)),
            .init(thread: .init(id: "72", author: .Mock.apple, creationDate: Date().addingTimeInterval(-200), body: "ake a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.", media: nil, isLiked: false, likeCount: 100))
        ]

        selectedMenuItem = .threads
    }
}
