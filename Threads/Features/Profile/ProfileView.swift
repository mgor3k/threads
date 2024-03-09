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
                    ForEach(1...10, id: \.self) { count in
                        Text("Placeholder \(count)")
                            .frame(height: 300)
                    }
                } header: {
                    HorizontalMenuView()
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
