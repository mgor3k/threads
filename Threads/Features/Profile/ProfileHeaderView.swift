//  Created by Maciej Gorecki on 09/03/2024.

import SwiftUI

struct ProfileHeaderView: View {
    let author: Author
    
    var body: some View {
        VStack {
            HStack {
                Text(author.name)
                    .font(.title)
                    .bold()

                Spacer()

                CachedAsyncImageView(
                    url: author.imageURL
                )
                .frame(width: 80, height: 80)
                .clipShape(Circle())
            }
        }
    }
}

#Preview {
    ProfileHeaderView(
        author: .Mock.bigmac
    )
}
