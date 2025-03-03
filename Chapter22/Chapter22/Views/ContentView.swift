//
//  ContentView.swift
//  Chapter22
//
//  Created by Jules Mickael on 2025-02-24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var store = MuseumStore()  // Data store for museum objects
    @State private var searchQuery: String = ""

    /// Filtered objects based on search query
    var filteredObjects: [MuseumObject] {
        if searchQuery.isEmpty {
            return store.objects
        } else {
            return store.objects.filter {
                $0.title.localizedCaseInsensitiveContains(searchQuery)
            }
        }
    }

    var body: some View {
        NavigationStack {
            VStack {
                // Search Bar (Dynamic Search)
                HStack {
                    TextField("Search objects...", text: $searchQuery)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)

                    Button(action: {
                
                    }) {
                        Image(systemName: "magnifyingglass")
                            .padding()
                            .background(Color("rom-foreground"))
                            .foregroundColor(.white)
                            .clipShape(Circle())
                    }
                }
                .padding(.top)

                // List of search results (Title, Description, & Navigation Link)
                List(filteredObjects, id: \.objectID) { object in
                    VStack(alignment: .leading, spacing: 5) {
                        // Object Title
                        Text(object.title)
                            .font(.headline)
                            .bold()
                            .foregroundColor(.white)
                            .padding(5)
                            .background(Color("rom-foreground"))
                            .cornerRadius(5)
                        
                        // Short Description
                        Text(object.creditLine)
                            .font(.subheadline)
                            .foregroundColor(.gray)

                        // Navigation Link to Object Details
                        NavigationLink(destination: ObjectView(object: object)) {
                            HStack {
                                Text("🔍 View Details")
                                    .foregroundColor(.blue)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.blue)
                            }
                        }
                        .padding(.top, 5)
                    }
                    .padding(5)
                    .listRowBackground(Color(" "))  // Background color
                }
                .navigationTitle("British Museum\nCollection")
            }
            .onAppear {
                store.loadObjectsFromJSON()  // Load objects from JSON
            }
        }
    }
}

/// ✅ Preview for SwiftUI Canvas
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
