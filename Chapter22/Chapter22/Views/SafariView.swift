//
//  SafariView.swift
//  Chapter22
//
//  Created by Jules Mickael on 2025-02-24.
//

import SwiftUI
import SafariServices

/// View to open British Museum web pages
struct SafariView: UIViewControllerRepresentable {
    let url: URL

    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariView>) {}
}

/// Preview for SwiftUI Canvas
struct SafariView_Previews: PreviewProvider {
    static var previews: some View {
        SafariView(url: URL(string: "https://www.britishmuseum.org/collection")!)
    }
}
