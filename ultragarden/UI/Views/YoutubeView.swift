//
//  VideoView.swift
//  ultragarden
//
//  Created by Flow on 05.01.2025.
//

import SwiftUI
import WebKit
import AVKit

struct WebkitView: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}

struct YoutubeView: View {
    var url: String
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Button("Go back", action: {
                    presentationMode.wrappedValue.dismiss() 
                })
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.LightGreen)
            }
            .frame(maxWidth: .infinity)

            VideoPlayer(player: AVPlayer(url: URL(string: url)!))
            .onAppear {
                AVPlayer(url: URL(string: url)!).play()
            }
        }
        .foregroundColor(Color.black)
        .background(Color.Green)
    }
}
