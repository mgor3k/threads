//  Created by Maciej Gorecki on 08/03/2024.

import Foundation

@Observable class ThreadStore: Identifiable {
    let id: String
    let author: Author

    let creationDate: Date

    let body: String
    let media: Media?

    var isLiked: Bool
    var likeCount: Int

    init(thread: Thread) {
        self.id = thread.id
        self.author = thread.author
        self.creationDate = thread.creationDate
        self.body = thread.body
        self.media = thread.media
        self.isLiked = thread.isLiked
        self.likeCount = thread.likeCount
    }

    func loggleLike() {
        if isLiked {
            isLiked = false
            likeCount -= 1
        } else {
            isLiked = true
            likeCount += 1
        }
    }
}
