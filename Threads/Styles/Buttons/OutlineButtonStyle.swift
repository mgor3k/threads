//  Created by Maciej Gorecki on 11/03/2024.

import SwiftUI

struct OutlineButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .opacity(
                configuration.isPressed ? 0.7 : 1
            )
            .overlay {
                RoundedRectangle(
                    cornerRadius: 12,
                    style: .continuous
                )
                .stroke(
                    Color.gray.opacity(configuration.isPressed ? 0.2 : 0.5),
                    lineWidth: 1
                )
            }
            .contentShape(Rectangle())
    }
}

extension ButtonStyle where Self == OutlineButtonStyle {
    static var outline: Self {
        return .init()
    }
}
