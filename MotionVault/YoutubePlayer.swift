//
//  YoutubePlayer.swift
//  MotionVault
//
//  Created by Khadija Daruwala on 2026-02-10.
//

import SwiftUI
import WebKit

struct YoutubePlayer: UIViewRepresentable{
    let webView = WKWebView()
    let videoId: String
    let youtubeBaseURL = APIConfig.shared?.youtubeBaseURL
    
    func makeUIView(context: Context) -> some UIView {
        webView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        guard let baseURLString = youtubeBaseURL, let baseURL = URL(string: baseURLString) else {return}
        let fullURL = baseURL.appending(path: videoId)
        print("Full URL for youtube: \(fullURL)")
        webView.load(URLRequest(url:fullURL))
    }
    
}
