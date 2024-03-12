//  Created by Maciej Gorecki on 12/03/2024.

import Foundation

@Observable class NewThreadStore {
    let me: Author = .Mock.bigmac

    var text = ""

    init() {

    }
}
