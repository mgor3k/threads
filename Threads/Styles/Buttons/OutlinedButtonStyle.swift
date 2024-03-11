//  Created by Maciej Gorecki on 11/03/2024.

import SwiftUI

struct OutlinedButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .bold()
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

extension ButtonStyle where Self == OutlinedButtonStyle {
    static var outlined: Self {
        return .init()
    }
}
