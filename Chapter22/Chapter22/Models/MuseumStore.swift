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

    init() {
        fetchMuseumData()
    }

    /// Fetch data from British Museum API
    func fetchMuseumData() {
        let urlString = "https://www.britishmuseum.org/api/objects"  // Remplace par l'URL correcte
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }
            do {
                let decodedData = try JSONDecoder().decode([MuseumObject].self, from: data)
                DispatchQueue.main.async {
                    self.objects = decodedData
                }
            } catch {
                print("Error decoding data: \(error)")
            }
        }.resume()
    }
}
