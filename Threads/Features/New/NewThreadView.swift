//  Created by Maciej Gorecki on 11/03/2024.

import SwiftUI

struct NewThreadView: View {
    @Environment(\.dismiss) var dismiss
    @State var store: NewThreadStore
    @FocusState var isFocused

    var body: some View {
        NavigationView {
            content
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button("Cancel") {
                            dismiss()
                        }
                        .tint(.white)
                    }

                    ToolbarItem(placement: .topBarTrailing) {
                        Button(action: {}) {
                            Image(systemName: "ellipsis.circle")
                        }
                        .tint(.white)
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle("New thread")
        }
        .onAppear {
            isFocused = true
        }
        .onChange(of: isFocused) {
            isFocused = true
        }
    }

    var content: some View {
        VStack {
            Divider()

            VStack(alignment: .leading) {
                HStack(alignment: .top, spacing: 12) {
                    CachedAsyncImageView(
                        url: store.me.imageURL
                    )
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())

                    VStack(alignment: .leading) {
                        Text(store.me.username)
                            .bold()

                        TextField("What's new", text: $store.text, prompt: nil, axis: .vertical)
                            .focused($isFocused)

                        Spacer()
                    }
                }
            }
            .padding()

            HStack {
                Spacer()

                Button(action: {}) {
                    Text("Post")
                        .padding(.horizontal)
                        .padding(.vertical, 6)
                }
                .buttonStyle(.filled)
            }
            .padding()
        }
    }
}

#Preview {
    NewThreadView(
        store: .init()
    )
}
