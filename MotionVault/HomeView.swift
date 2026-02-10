//
//  HomeView.swift
//  MotionVault
//
//  Created by Khadija Daruwala on 2026-02-05.
//

import SwiftUI

struct HomeView: View {

    let viewModel = ViewModel()
    @State private var titleDataPath = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $titleDataPath) {
            GeometryReader { geo in
                ScrollView {
                    switch viewModel.homeStatus {
                    case .notStarted:
                        EmptyView()
                    case .fetching:
                        ProgressView()
                            .frame(width: geo.size.width, height: geo.size.height)
                    case .success:
                        LazyVStack{
                            AsyncImage(url: URL(string: viewModel.heroTitle.posterPath ?? "")){ image in
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .overlay{
                                        LinearGradient(stops: [Gradient.Stop(color: .clear, location: 0.8),
                                                               Gradient.Stop(color: .gradient, location: 1)],
                                                       startPoint: .top,
                                                       endPoint: .bottom)
                                    }
                            } placeholder: {
                                ProgressView()
                            }
                            
                            .frame(width: geo.size.width, height: geo.size.height * 0.85)
                            HStack{
                                Button{
                                    titleDataPath.append(viewModel.heroTitle)
                                } label: {
                                    Text(Constants.playString)
                                        .ghostButton()
                                }
                                Button{
                                    
                                } label: {
                                    Text(Constants.downloadString)
                                        .ghostButton()
                                }
                            }
                            
                            HorizontalListView(header: Constants.trendingMovieString, title: viewModel.trenddingMovies){ title in
                                titleDataPath.append(title)
                            }
                            HorizontalListView(header: Constants.trendingTVString, title: viewModel.trenddingTV){title in
                                titleDataPath.append(title)
                            }
                            HorizontalListView(header: Constants.topRatedMovieString, title: viewModel.topRatedMovies){title in
                                titleDataPath.append(title)
                            }
                            HorizontalListView(header: Constants.topRatedTVString, title: viewModel.topRatedTV){title in
                                titleDataPath.append(title)
                            }
                        }
                    case .failed(let error):
                        Text("Error: \(error.localizedDescription)")
                    }
                }
                .task {
                    await viewModel.getTitles()
                }
                .navigationDestination(for: Title.self) { title in
                    TitleDetailView(title: title)
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
