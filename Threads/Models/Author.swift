//  Created by Maciej Gorecki on 08/03/2024.

import Foundation

struct Author: Hashable {
    enum Following: Equatable {
        case you
        case them
        case both
        case none
    }

    let name: String
    let username: String

    let bio: String

    let imageURL: URL

    let isVerified: Bool

    let following: Following

    let followersAvatars: [URL]
    let followersCount: Int
}
