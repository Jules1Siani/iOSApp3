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
                Text(object.title)
                    .font(.title)
                    .bold()
                    .foregroundColor(Color("rom-foreground"))
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, alignment: .leading)

                // Image Handling
                if let url = URL(string: object.primaryImageSmall), !object.primaryImageSmall.isEmpty {
                    AsyncImage(url: url) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()  // ⏳ Loading indicator
                        case .success(let image):
                            image.resizable()
                                .scaledToFit()
                                .frame(height: 300)
                                .cornerRadius(10)
                        case .failure:
                            Image(systemName: "photo")  //Default placeholder
                                .resizable()
                                .scaledToFit()
                                .frame(height: 300)
                                .foregroundColor(.gray)
                        @unknown default:
                            EmptyView()
                        }
                    }
                    .padding(.horizontal)
                } else {
                    Image(systemName: "photo")  //Default placeholder if no image
                        .resizable()
                        .scaledToFit()
                        .frame(height: 300)
                        .foregroundColor(.gray)
                        .padding(.horizontal)
                }

                // Description Section
                VStack(alignment: .leading, spacing: 10) {
                    Text("📜 Description:")
                        .font(.headline)
                        .foregroundColor(Color("rom-foreground"))

                    Text(object.creditLine)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .padding(.horizontal)
                }
                .padding()
                // 🔗 Open British Museum Website using SafariView
                if let url = URL(string: object.objectURL) {
                    NavigationLink(destination: SafariView(url: url)) {
                        HStack {
                            Image(systemName: "safari")
                                .foregroundColor(.white)
                            Text("View on British Museum Website")
                                .foregroundColor(.white)
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color("rom-foreground"))
                        .cornerRadius(10)
                    }
                    .padding()
                }

            }
            .padding(.vertical)
            .background(Color(" "))
        }
        .navigationTitle("Object Details")
    }
}

/// ✅ Preview for SwiftUI Canvas
struct ObjectView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ObjectView(
                object: MuseumObject(
                    objectID: 101,
                    title: "Rosetta Stone",
                    creditLine: "The Rosetta Stone is one of the most famous objects in the British Museum. But what is it?The Stone is a broken part of a bigger stone slab. It has a message carved into it, written in three types of writing. It was an important clue that helped experts learn to read Egyptian hieroglyphs(Opens in new window) (a writing system that used pictures as signs).",
                    objectURL: "https://www.britishmuseum.org/collection/object/Y_EA24",
                    isPublicDomain: true,
                    primaryImageSmall: "https://www.britishmuseum.org/sites/default/files/styles/uncropped_medium/public/2022-06/Stone-and-reconstruction-1000x854.jpg?itok=gjaBmcLw"
                )
            )
        }
    }
}
