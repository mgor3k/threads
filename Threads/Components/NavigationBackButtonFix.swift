//  Created by Maciej Gorecki on 09/03/2024.

import SwiftUI

struct NavigationBackButtonFix<Content: View>: View {
    @State var didAppear = false

    let content: () -> (Content)

    var body: some View {
        content()
            .onAppear {
                didAppear = true
            }
            .navigationBarBackButtonHidden(!didAppear)
    }
}
