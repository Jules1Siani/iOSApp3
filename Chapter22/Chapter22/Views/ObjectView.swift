//
//  ObjectView.swift
//  Chapter22
//
//  Created by Jules Mickael on 2025-02-24.
//

import SwiftUI

/// View displaying detailed information about a museum object
struct ObjectView: View {
    let object: MuseumObject

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                if let url = URL(string: object.primaryImageSmall) {
                    AsyncImage(url: url) { image in
                        image.resizable()
                            .scaledToFit()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(height: 300)
                }

                Text("Description:")
                    .font(.headline)
                    .foregroundColor(.primary)

                Text(object.creditLine)
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                if let url = URL(string: object.objectURL) {
                    Link("View on British Museum Website", destination: url)
                        .foregroundColor(.blue)
                        .padding()
                }
            }
            .padding()
        }
        .navigationTitle("Object Details")
    }
}

