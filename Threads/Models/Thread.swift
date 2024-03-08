//  Created by Maciej Gorecki on 08/03/2024.

import Foundation

class Thread: ObservableObject, Identifiable {
    let id: String
    let author: Author

    let creationDate: Date

    let body: String
    let media: Media?

    @Published var isLiked: Bool
    @Published var likeCount: Int

    init(
        id: String,
        author: Author,
        creationDate: Date,
        body: String,
        media: Media?,
        isLiked: Bool,
        likeCount: Int
    ) {
        self.id = id
        self.author = author
        self.creationDate = creationDate
        self.body = body
        self.media = media
        self.isLiked = isLiked
        self.likeCount = likeCount
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
