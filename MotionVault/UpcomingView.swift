//
//  UpcomingView.swift
//  MotionVault
//
//  Created by Khadija Daruwala on 2026-02-12.
//

import SwiftUI

struct UpcomingView: View {
    let viewModel = ViewModel()
    
    var body: some View {
        NavigationStack {
            GeometryReader { geo in
                switch viewModel.upcomingStatus {
                case .notStarted:
                    EmptyView()
                case .fetching:
                    ProgressView()
                        .frame(width: geo.size.width, height: geo.size.height)
                case .success:
                    VerticalListView(titiles: viewModel.upcomingMovies)
                case .failed(let underlyingError):
                    Text(underlyingError.localizedDescription)
                }
            }
            .task {
                await viewModel.getUpcomingMovies()
            }
        }
    }
}

#Preview {
    UpcomingView()
}
