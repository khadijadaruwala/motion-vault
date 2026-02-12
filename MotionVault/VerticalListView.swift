//
//  VerticalListView.swift
//  MotionVault
//
//  Created by Khadija Daruwala on 2026-02-12.
//

import SwiftUI

struct VerticalListView: View {
    var titiles: [Title]
    
    var body: some View {
        List(titiles){ title in
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
    }
}

#Preview {
    VerticalListView(titiles: Title.previewTitles)
}
