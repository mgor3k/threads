//  Created by Maciej Gorecki on 09/03/2024.

import Foundation

enum ProfileMenuItem: Int, HorizontalMenuItem, Identifiable, CaseIterable {
    case threads, replies, reposts

    var id: Int {
        rawValue
    }

    var menuTitle: String {
        switch self {
        case .threads: "Threads"
        case .replies: "Replies"
        case .reposts: "Reposts"
        }
    }
}
