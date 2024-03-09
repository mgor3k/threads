//  Created by Maciej Gorecki on 09/03/2024.

import SwiftUI

extension ThreadsView {
    struct LoadingView: View {
        var body: some View {
            ScrollView {
                VStack {
                    ForEach(0..<8) { _ in
                        ThreadView.LoadingView()
                            .padding()
                    }
                }
            }
            .scrollDisabled(true)
        }
    }
}

#Preview {
    ThreadsView.LoadingView()
}
