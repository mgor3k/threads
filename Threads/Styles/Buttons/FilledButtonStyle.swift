//  Created by Maciej Gorecki on 11/03/2024.

import SwiftUI

struct FilledButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .bold()
            .foregroundStyle(.black)
            .background(
                RoundedRectangle(
                    cornerRadius: 12,
                    style: .continuous
                )
                .foregroundStyle(.white)
            )
            .opacity(
                configuration.isPressed ? 0.7 : 1
            )
            .contentShape(Rectangle())
    }
}

extension ButtonStyle where Self == FilledButtonStyle {
    static var filled: Self {
        return .init()
    }
}
