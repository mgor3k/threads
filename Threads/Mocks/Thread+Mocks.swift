//  Created by Maciej Gorecki on 08/03/2024.

import Foundation

// TODO: For testing purpose
extension Thread {
    static var mocks: [Thread] {
        let authorBigMac = Author(
            username: "@bigmac",
            imageURL: URL(string: "https://i.pravatar.cc/150?img=3")!
        )

        let authorApple = Author(
            username: "@apple",
            imageURL: URL(string: "https://i.pravatar.cc/150?img=4")!
        )

        return [
            Thread(
                id: "1",
                author: authorBigMac,
                creationDate: Date().addingTimeInterval(-500),
                body: "some text",
                media: nil,
                isLiked: false,
                likeCount: 2
            ),
            Thread(
                id: "2",
                author: authorApple,
                creationDate: Date().addingTimeInterval(-800),
                body: "some text longer lalalla lalsdlasldsal dla sdlasl dlal dlasdl asld lasld asldkaslk dalskd laskd laskd l",
                media: .image(URL(string: "https://picsum.photos/id/237/200/300")!),
                isLiked: false,
                likeCount: 1
            ),
        ]
    }
}
