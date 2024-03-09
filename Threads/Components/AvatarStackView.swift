//  Created by Maciej Gorecki on 09/03/2024.

import SwiftUI

struct AvatarStackView: View {
    let urls: [URL]

    var body: some View {
        HStack {
            let model = Array(zip(urls.indices, urls))

            ForEach(model, id: \.0) { (index, url) in
                CachedAsyncImageView(url: url)
                    .scaledToFill()
                    .frame(width: 20, height: 20)
                    .clipShape(Circle())
                    .padding(2)
                    .background(Color.black.clipShape(Circle()))
                    .transition(.scale)
                    .offset(x: CGFloat(index * -14))
            }
        }
    }
}

#Preview {
    AvatarStackView(urls: [])
}
