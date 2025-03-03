//
//  MuseumStore.swift
//  Chapter22
//
//  Created by Jules Mickael on 2025-02-24.
//

import Foundation

/// Store handling the objects retrieved from the British Museum API
class MuseumStore: ObservableObject {
    @Published var objects: [MuseumObject] = []
    @Published var isLoading: Bool = false

    init() {
        loadObjectsFromJSON()  // Load objects from JSON at startup
    }

    /// Loads museum objects from a local JSON file
    func loadObjectsFromJSON() {
        guard let url = Bundle.main.url(forResource: "museum_objects", withExtension: "json") else {
            print("❌ JSON file not found")
            return
        }

        do {
            let data = try Data(contentsOf: url)
            let decodedObjects = try JSONDecoder().decode([MuseumObject].self, from: data)
            DispatchQueue.main.async {
                self.objects = decodedObjects
            }
        } catch {
            print("❌ Error decoding JSON: \(error.localizedDescription)")
        }
    }
}
