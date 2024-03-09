//  Created by Maciej Gorecki on 08/03/2024.

import SwiftUI

struct HomeView: View {
    enum Route: Hashable {
        case profile(Author)
    }

    @Environment(\.dependencies) var dependencies

    @State var route: [Route] = []

    var body: some View {
        NavigationStack(path: $route) {
            ThreadsView(
                store: .init(
                    provider: dependencies.threadsProvider
                ),
                onAction: { action in
                    switch action {
                    case .profile(let author):
                        route.append(.profile(author))
                    }
                }
            )
            .navigationDestination(for: Route.self) { route in
                switch route {
                case .profile(let author):
                    NavigationBackButtonFix {
                        ProfileView(author: author)
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
