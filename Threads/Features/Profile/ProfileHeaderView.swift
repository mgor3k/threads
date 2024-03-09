//  Created by Maciej Gorecki on 09/03/2024.

import SwiftUI

struct ProfileHeaderView: View {
    let author: Author
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Text(author.name)
                    .font(.title)
                    .bold()

                Spacer()

                CachedAsyncImageView(
                    url: author.imageURL
                )
                .frame(width: 80, height: 80)
                .clipShape(Circle())
                .overlay(alignment: .bottomLeading) {
                    if author.isVerified {
                        Image(systemName: "checkmark.circle.fill")
                            .font(.headline)
                            .foregroundStyle(.blue)
                            .padding(1)
                            .background(
                                Color.black
                                    .clipShape(.circle)
                            )
                            .offset(x: 2, y: -2)
                    }
                }
            }
        }
    }
}

#Preview {
    ProfileHeaderView(
        author: .Mock.apple
    )
}
