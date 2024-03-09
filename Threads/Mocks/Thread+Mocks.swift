//  Created by Maciej Gorecki on 08/03/2024.

import Foundation

// TODO: For testing purpose
extension Thread {
    static var mocks: [Thread] {
        return [
            Thread(
                id: "1",
                author: .Mock.bigmac,
                creationDate: Date().addingTimeInterval(-500),
                body: "some text",
                media: nil,
                isLiked: false,
                likeCount: 2
            ),
            Thread(
                id: "2",
                author: .Mock.apple,
                creationDate: Date().addingTimeInterval(-800),
                body: "some text longer lalalla lalsdlasldsal dla sdlasl dlal dlasdl asld lasld asldkaslk dalskd laskd laskd l",
                media: .image(URL(string: "https://picsum.photos/id/237/200/300")!),
                isLiked: false,
                likeCount: 1
            ),
            Thread(
                id: "3",
                author: .Mock.apple,
                creationDate: Date().addingTimeInterval(-1000),
                body: "lorem ipsum",
                media: nil,
                isLiked: true,
                likeCount: 9
            ),
        ]
    }
}
