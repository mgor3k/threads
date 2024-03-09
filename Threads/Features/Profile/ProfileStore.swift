//  Created by Maciej Gorecki on 09/03/2024.

import Foundation

@Observable class ProfileStore {
    let author: Author

    init(author: Author) {
        self.author = author
    }
}
