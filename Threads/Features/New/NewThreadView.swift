//  Created by Maciej Gorecki on 11/03/2024.

import SwiftUI

struct NewThreadView: View {
    @Environment(\.dismiss) var dismiss

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
    }

    var content: some View {
        VStack {
            Divider()
            
            Text("Create post")

            Spacer()
        }
    }
}

#Preview {
    NewThreadView()
}
