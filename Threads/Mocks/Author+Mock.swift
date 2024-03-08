//  Created by Maciej Gorecki on 08/03/2024.

import Foundation

extension Author {
    enum Mock {
        static let bigmac = Author(
            username: "@bigmac",
            imageURL: URL(string: "https://i.pravatar.cc/150?img=3")!
        )

        static let apple = Author(
            username: "@apple",
            imageURL: URL(string: "https://i.pravatar.cc/150?img=4")!
        )
    }
}
