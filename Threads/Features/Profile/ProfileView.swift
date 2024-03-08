//  Created by Maciej Gorecki on 08/03/2024.

import SwiftUI

struct ProfileView: View {
    let author: Author

    var body: some View {
        Text(author.username)
    }
}

#Preview {
    ProfileView(
        author: .Mock.bigmac
    )
}
