//  Created by Maciej Gorecki on 08/03/2024.

import SwiftUI

struct ThreadsView: View {
    @Bindable var store: ThreadsStore

    var body: some View {
        switch store.state {
        case .loading:
            ProgressView()
                .onAppear(perform: store.initialFetch)
        case .loaded(let threads):
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
        case .failure:
            Color.red
        }
    }
}

#Preview {
    ThreadsView(
        store: .init(
            provider: .live
        )
    )
}
