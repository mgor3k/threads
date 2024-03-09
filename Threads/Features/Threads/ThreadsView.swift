//  Created by Maciej Gorecki on 08/03/2024.

import SwiftUI

struct ThreadsView: View {
    enum Action {
        case profile(Author)
    }

    @Bindable var store: ThreadsStore
    let onAction: (Action) -> Void

    var body: some View {
        switch store.state {
        case .loading:
            LoadingView()
                .onAppear(perform: store.initialFetch)
        case .loaded(let threads):
            ScrollView {
                LazyVStack {
                    ForEach(threads) { thread in
                        ThreadView(
                            thread: thread,
                            onProfile: {
                                onAction(.profile($0))
                            }
                        )
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
            provider: .mock()
        ),
        onAction: { _ in }
    )
}
