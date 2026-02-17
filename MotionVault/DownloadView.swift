//
//  DownloadView.swift
//  MotionVault
//
//  Created by Khadija Daruwala on 2026-02-17.
//

import SwiftUI
import SwiftData

struct DownloadView: View {
    @Query(sort: \Title.title) var savedTitles: [Title]
    
    var body: some View {
        NavigationStack {
            if savedTitles.isEmpty {
                Text("No Downloads")
                    .padding()
                    .font(.title3)
                    .bold()
            } else{
                VerticalListView(titiles: savedTitles, canDelete: true)
            }
        }
    }
}

#Preview {
    DownloadView()
}
