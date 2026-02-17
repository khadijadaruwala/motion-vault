//
//  VerticalListView.swift
//  MotionVault
//
//  Created by Khadija Daruwala on 2026-02-12.
//

import SwiftUI
import SwiftData

struct VerticalListView: View {
    var titiles: [Title]
    let canDelete: Bool
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        List(titiles){ title in
            NavigationLink{
                TitleDetailView(title: title)
            }label: {
                AsyncImage(url: URL(string: title.posterPath ?? "")){ image in
                    HStack {
                        image
                            .resizable()
                            .scaledToFit()
                            .clipShape(.rect(cornerRadius: 10))
                            .padding(5)
                        Text((title.name ?? title.title) ?? "")
                            .font(.system(size: 14))
                            .bold()
                    }
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 150)
            }
            .swipeActions(edge: .trailing) {
                if canDelete{
                    Button{
                        modelContext.delete(title)
                        try? modelContext.save()
                    } label: {
                        Image(systemName: "trash")
                            .tint(.red)
                    }
                }
            }
        }
    }
}

#Preview {
    VerticalListView(titiles: Title.previewTitles, canDelete: true)
}
