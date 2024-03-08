//  Created by Maciej Gorecki on 08/03/2024.

import Foundation

struct Thread {
    let author: Author

    let creationDate: Date

    let body: String
    let media: Media?

    let isLiked: Bool
    let likeCount: Int
}

// TODO: For testing purpose
extension Collection where Element == Thread {
    static var mock: [Thread] {
        let author = Author(
            username: "@bigmac",
            imageURL: URL(string: "https://i.pravatar.cc/150?img=3")!
        )
        return [
            Thread(
                author: author,
                creationDate: Date(timeIntervalSince1970: 1709835487),
                body: "some text",
                media: nil,
                isLiked: false,
                likeCount: 2
            )
        ]
    }
}
