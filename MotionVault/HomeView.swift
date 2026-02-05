//
//  HomeView.swift
//  MotionVault
//
//  Created by Khadija Daruwala on 2026-02-05.
//

import SwiftUI

struct HomeView: View {
    var heroTestTile = Constants.testTitleURL
    
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: heroTestTile)){ image in
                image
                    .resizable()
                    .scaledToFit()
                
            }placeholder: {
                ProgressView()
            }
            
            HStack{
                Button{
                    
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
        }
    }
}

#Preview {
    HomeView()
}
