//  Created by Maciej Gorecki on 09/03/2024.

import SwiftUI
import Shimmer

extension ThreadView {
    struct LoadingView: View {
        let widths = [3, 1.2, 1.8]

        var body: some View {
            HStack(alignment: .top, spacing: 12) {
                Circle()
                    .frame(width: 40, height: 40)

                GeometryReader { proxy in
                    VStack(alignment: .leading) {
                        ForEach(widths, id: \.self) { width in
                            RoundedRectangle(cornerRadius: 4, style: .continuous)
                                .foregroundStyle(.gray)
                                .frame(
                                    width: proxy.size.width / width,
                                    height: 10
                                )
                        }
                    }
                }
            }
            .frame(height: 60)
            .frame(maxWidth: .infinity, alignment: .leading)
            .redacted(reason: .placeholder)
            .shimmering(
                gradient: .init(
                    colors: [
                        .black.opacity(0.4),
                        .black,
                        .black.opacity(0.4)
                    ]
                )
            )
        }
    }
}

#Preview {
    ThreadView.LoadingView()
}
