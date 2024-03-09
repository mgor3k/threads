//  Created by Maciej Gorecki on 09/03/2024.

import Foundation

@Observable class ProfileStore {
    let author: Author

    var selectedMenuItem: ProfileMenuItem = .threads

    init(author: Author) {
        self.author = author
    }
}
