//  Created by Maciej Gorecki on 08/03/2024.

import Foundation

extension Author {
    enum Mock {
        static let bigmac = Author(
            name: "Maciej Górecki",
            username: "bigmac",
            bio: "Some bio",
            imageURL: URL(string: "https://i.pravatar.cc/150?img=3")!,
            isVerified: false
        )

        static let apple = Author(
            name: "Apple",
            username: "apple",
            bio: "Some bio\nNewline",
            imageURL: URL(string: "https://i.pravatar.cc/150?img=4")!,
            isVerified: true
        )
    }
}
