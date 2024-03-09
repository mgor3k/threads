//  Created by Maciej Gorecki on 08/03/2024.

import SwiftUI

struct ProfileView: View {
    let author: Author

    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack(pinnedViews: [.sectionHeaders]) {
                ProfileHeaderView(author: author)
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
        author: .Mock.bigmac
    )
}
