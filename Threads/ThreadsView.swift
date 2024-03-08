//  Created by Maciej Gorecki on 08/03/2024.

import SwiftUI

struct ThreadsView: View {
    let threads: [Thread]

    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(threads) { thread in
                    ThreadView(thread: thread)
                        .padding(.horizontal)
                        .padding(.vertical, 6)

                    Divider()
                        .overlay {
                            Color.gray.opacity(0.5)
                        }
                }
            }
        }
        .padding(.top, 1)
    }
}

#Preview {
    ThreadsView(
        threads: Thread.mocks
    )
}
