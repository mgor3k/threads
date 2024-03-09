//  Created by Maciej Gorecki on 09/03/2024.

import SwiftUI

protocol HorizontalMenuItem: Identifiable, Equatable {
    var menuTitle: String { get }
}

struct HorizontalMenuView<Item: HorizontalMenuItem>: View {
    let items: [Item]

    @Namespace var namespace
    @Binding var selectedItem: Item

    var body: some View {
        HStack {
            ForEach(items) { item in
                Text(item.menuTitle)
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
    struct MockItem: HorizontalMenuItem {
        let menuTitle: String
        var id: String { menuTitle }
    }

    return HorizontalMenuView<MockItem>(
        items: [
            MockItem(menuTitle: "First"),
            MockItem(menuTitle: "Second")
        ],
        selectedItem: .constant(MockItem(menuTitle: "First"))
    )
}
