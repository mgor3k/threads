//  Created by Maciej Gorecki on 11/03/2024.

import Foundation

enum Tab: Int, Identifiable, CaseIterable {
    case home, search, newPost, favorites, profile

    var id: Int { rawValue }
}
