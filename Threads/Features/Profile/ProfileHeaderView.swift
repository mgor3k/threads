//  Created by Maciej Gorecki on 09/03/2024.

import SwiftUI

struct ProfileHeaderView: View {
    let author: Author
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 12) {
                    Text(author.name)
                        .font(.title)
                        .bold()

                    HStack {
                        Text(author.username)

                        Text("threads.net")
                            .font(.caption)
                            .foregroundStyle(.gray)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 6)
                            .background(Color.gray.opacity(0.2))
                            .clipShape(.rect(cornerRadius: 12, style: .continuous))
                    }
                }

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

            Text(author.bio)
                .multilineTextAlignment(.leading)

            HStack(spacing: 0) {
                AvatarStackView(urls: author.followersAvatars)

                Text("\(author.followersCount) followers")
                    .font(.callout)
                    .foregroundStyle(.gray)
                    .offset(x: -14)

                Spacer()
            }
        }
    }
}

#Preview {
    ProfileHeaderView(
        author: .Mock.apple
    )
}
