//  Created by Maciej Gorecki on 09/03/2024.

import SwiftUI

struct HorizontalMenuView: View {
    let items: [String] = [
        "Threads",
        "Replies",
        "Reposts"
    ]

    @Namespace var namespace
    @State var selectedItem = "Threads"

    var body: some View {
        HStack {
            ForEach(items, id: \.self) { item in
                Text(item)
                    .foregroundStyle(
                        selectedItem == item ? .white : .gray
                    )
                    .bold(selectedItem == item)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .contentShape(.rect)
                    .onTapGesture {
                        selectedItem = item
                    }
                    .overlay(alignment: .bottom) {
                        if selectedItem == item {
                            Rectangle()
                                .foregroundStyle(.white)
                                .frame(height: 1)
                                .matchedGeometryEffect(id: "selected", in: namespace)
                        }
                    }
            }
        }
        .background(Color.black)
        .animation(.snappy.speed(2), value: selectedItem)
        .padding(.horizontal)
        .overlay(alignment: .bottom) {
            Divider()
                .overlay {
                    Color.gray.opacity(0.5)
                }
        }
    }
}

#Preview {
    HorizontalMenuView()
}
