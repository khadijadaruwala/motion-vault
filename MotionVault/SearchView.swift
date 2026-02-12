//
//  SearchView.swift
//  MotionVault
//
//  Created by Khadija Daruwala on 2026-02-12.
//

import SwiftUI

struct SearchView: View {
    var titles = Title.previewTitles
    
    var body: some View {
        ScrollView{
            LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
                ForEach(titles){ title in
                    AsyncImage(url: URL(string: title.posterPath ?? "")){ image in
                        image
                            .resizable()
                            .scaledToFit()
                            .clipShape(.rect(cornerRadius: 10))
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 120, height: 200)
                }
            }
        }
    }
}

#Preview {
    SearchView()
}
