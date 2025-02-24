//
//  ContentView.swift
//  Chapter22
//
//  Created by Jules Mickael on 2025-02-24.
//

import SwiftUI

/// Main view displaying the list of museum objects
struct ContentView: View {
    @StateObject private var store = MuseumStore()
    @State private var searchQuery: String = ""

    var body: some View {
        NavigationView {
            VStack {
                TextField("Search...", text: $searchQuery)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                List(store.objects.filter { object in
                    searchQuery.isEmpty || object.title.localizedCaseInsensitiveContains(searchQuery)
                }) { object in
                    NavigationLink(destination: ObjectView(object: object)) {
                        HStack {
                            if let url = URL(string: object.primaryImageSmall) {
                                AsyncImage(url: url) { image in
                                    image.resizable()
                                        .scaledToFit()
                                        .frame(width: 100, height: 100)
                                } placeholder: {
                                    ProgressView()
                                }
                            }
                            
                            VStack(alignment: .leading) {
                                Text(object.title)
                                    .font(.headline)
                                Text(object.creditLine)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
            }
            .navigationTitle("British Museum Collection")
        }
    }
}
