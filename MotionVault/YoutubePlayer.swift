import SwiftUI
import WebKit

struct YoutubePlayer: UIViewRepresentable {
    
    let videoId: String
    let youtubeBaseURL = APIConfig.shared?.youtubeBaseURL
    
    private let webView: WKWebView = {
        let config = WKWebViewConfiguration()
        config.allowsInlineMediaPlayback = true
        if #available(iOS 10.0, *) {
            config.mediaTypesRequiringUserActionForPlayback = []
        }
        return WKWebView(frame: .zero, configuration: config)
    }()
    
    func makeUIView(context: Context) -> WKWebView {
        webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard
            let baseString = youtubeBaseURL,
            let embedBaseURL = URL(string: baseString)
        else {
            print("Invalid YouTube base URL")
            return
        }
        
        // Build full embed URL using your base URL
        let fullEmbedURL = embedBaseURL.appendingPathComponent(videoId)
        
        let origin = "https://example.com"
        
        let html = """
        <!doctype html>
        <html>
          <head>
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <style>
              html, body { margin:0; padding:0; background:black; height:100%; }
              iframe { position:fixed; inset:0; width:100%; height:100%; border:0; }
            </style>
          </head>
          <body>
            <iframe
              src="\(fullEmbedURL)?playsinline=1&origin=\(origin)"
              allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
              allowfullscreen
              referrerpolicy="strict-origin-when-cross-origin">
            </iframe>
          </body>
        </html>
        """
        
        uiView.loadHTMLString(html, baseURL: URL(string: origin)!)
    }
}

