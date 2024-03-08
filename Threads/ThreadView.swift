//  Created by Maciej Gorecki on 08/03/2024.

import SwiftUI

struct ThreadView: View {
    let thread: Thread

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
            AsyncImage(url: thread.author.imageURL) { phase in
                switch phase {
                case .empty:
                    Color.gray
                case .success(let image):
                    image.resizable()
                case .failure:
                    Color.red
                @unknown default:
                    Color.green
                }
            }
            .frame(width: 44, height: 44)
            .clipShape(.circle)

            VStack(alignment: .leading, spacing: 6) {
                HStack {
                    Text(thread.author.username)
                        .bold()
                    Text(Self.formatter.string(from: thread.creationDate, to: .now) ?? "")
                        .foregroundStyle(.gray)
                }

                Text(thread.body)

                HStack {
                    Image(systemName: "bubble.right")
                    Spacer()
                    Image(systemName: "arrow.2.squarepath")
                    Spacer()
                    Image(systemName: "heart")
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
}

#Preview {
    ThreadView(
        thread: .mocks[0]
    )
}
