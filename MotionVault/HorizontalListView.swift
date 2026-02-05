//
//  HorizontalListView.swift
//  MotionVault
//
//  Created by Khadija Daruwala on 2026-02-05.
//

import SwiftUI

struct HorizontalListView: View {
    let header: String
    var titles = [Constants.testTitleURL, Constants.testTitleURL2, Constants.testTitleURL3]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(header)
                .font(.title)
            ScrollView(.horizontal){
                LazyHStack{
                    ForEach(titles, id: \.self){ titles in
                        AsyncImage(url: URL(string: titles)){ image in
                            image
                                .resizable()
                                .scaledToFit()
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 120, height: 200)
                    }
                }
            }
        }
        .frame(height: 250)
        .padding(10)
    }
}

#Preview {
    HorizontalListView(header: Constants.trendingMovieString)
}
