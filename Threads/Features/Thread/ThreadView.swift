//  Created by Maciej Gorecki on 08/03/2024.

import Pow
import SwiftUI

struct ThreadView: View {
    @Bindable var thread: ThreadStore
    let onProfile: (Author) -> Void

    static let formatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .abbreviated
        formatter.allowedUnits = [
            .year, .month, .day, .hour, .minute, .second
        ]
        formatter.zeroFormattingBehavior = .dropAll
        formatter.maximumUnitCount = 1
        return formatter
    }()

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            CachedAsyncImageView(
                url: thread.author.imageURL
            )
            .frame(width: 40, height: 40)
            .clipShape(.circle)

            VStack(alignment: .leading, spacing: 6) {
                HStack(spacing: thread.author.isVerified ? 4 : 8) {
                    Text(thread.author.username)
                        .bold()
                        .onTapGesture {
                            onProfile(thread.author)
                        }

                    if thread.author.isVerified {
                        Image(systemName: "checkmark.circle.fill")
                            .font(.caption)
                            .foregroundStyle(.blue)
                    }

                    Text(Self.formatter.string(from: thread.creationDate, to: .now) ?? "")
                        .foregroundStyle(.gray)
                }

                Text(thread.body)

                media

                HStack {
                    Image(systemName: "bubble.right")
                    Spacer()
                    Image(systemName: "arrow.2.squarepath")
                    Spacer()

                    Button {
                        thread.loggleLike()
                    } label: {
                        Label("\(thread.likeCount)", systemImage: thread.isLiked ? "heart.fill" : "heart")
                            .foregroundStyle(thread.isLiked ? .red : .gray)
                            .contentTransition(.numericText())
                    }
                    .changeEffect(
                      .spray(origin: UnitPoint(x: 0.25, y: 0.5)) {
                        Image(systemName: "heart.fill")
                          .foregroundStyle(.red)
                      }, value: thread.isLiked, isEnabled: thread.isLiked)

                    Spacer()
                    Image(systemName: "paperplane")
                    Spacer()
                    Image(systemName: "ellipsis")
                }
                .font(.caption)
                .foregroundStyle(.gray)
                .padding(.top, 8)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    @ViewBuilder
    var media: some View {
        switch thread.media {
        case .image(let url):
            CachedAsyncImageView(
                url: url
            )
            .scaledToFit()
            .frame(maxHeight: 300)
            .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
        case .none:
            EmptyView()
        }
    }
}

#Preview {
    ThreadView(
        thread: .init(
            thread: .mocks[1]
        ),
        onProfile: { _ in }
    )
}
