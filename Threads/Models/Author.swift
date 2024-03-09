//  Created by Maciej Gorecki on 08/03/2024.

import Foundation

struct Author: Hashable {
    let name: String
    let username: String

    let bio: String

    let imageURL: URL

    let isVerified: Bool
}
