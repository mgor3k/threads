//  Created by Maciej Gorecki on 08/03/2024.

import SwiftUI

struct MainView: View {
    var body: some View {
        ThreadsView(threads: Thread.mocks)
    }
}

#Preview {
    MainView()
}
