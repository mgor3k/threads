//  Created by Maciej Gorecki on 11/03/2024.

import SwiftUI

extension View {
    @ViewBuilder
    func filledButtonWhen(_ condition: Bool) -> some View {
        if condition {
            self.buttonStyle(.filled)
        } else {
            self.buttonStyle(.outlined)
        }
    }
}
