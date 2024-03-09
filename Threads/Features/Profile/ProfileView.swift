//  Created by Maciej Gorecki on 08/03/2024.

import SwiftUI

struct ProfileView: View {
    @State var store: ProfileStore

    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack(pinnedViews: [.sectionHeaders]) {
                ProfileHeaderView(author: store.author)
                    .padding(.top)
                    .padding(.horizontal)

                Section {
                    ForEach(store.selectedThreads) { thread in
                        ThreadView(
                            thread: thread,
                            onProfile: { _ in
//                                onAction(.profile($0))
                            }
                        )
                        .padding(.horizontal)
                        .padding(.vertical, 6)
                    }
                } header: {
                    HorizontalMenuView(
                        items: ProfileMenuItem.allCases,
                        selectedItem: $store.selectedMenuItem
                    )
                    .scaleEffect(1)
                }
            }
        }
    }
}

#Preview {
    ProfileView(
        store: .init(
            author: .Mock.bigmac
        )
    )
}
