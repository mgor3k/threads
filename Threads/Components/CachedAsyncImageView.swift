//  Created by Maciej Gorecki on 08/03/2024.

import SwiftUI

struct CachedAsyncImageView: View {
    enum ImageState: Equatable {
        case placeholder
        case loaded(UIImage)
    }

    @Environment(\.dependencies) var dependencies
    @State var state: ImageState = .placeholder

    let url: URL

    var body: some View {
        ZStack {
            switch state {
            case .placeholder:
                ProgressView()
                    .onAppear(perform: fetchImage)
            case .loaded(let image):
                Image(uiImage: image)
                    .resizable()
            }
        }
    }

    private func fetchImage() {
        Task {
            do {
                let image = try await dependencies.imageFetcher.fetch(url)
                state = .loaded(image)
            } catch {
                state = .placeholder
            }
        }
    }
}

#Preview {
    CachedAsyncImageView(
        url: .init(string: "https://i.pravatar.cc/150?img=3")!
    )
}
