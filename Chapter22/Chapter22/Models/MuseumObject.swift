//
//  MuseumObject.swift
//  Chapter22
//
//  Created by Jules Mickael on 2025-02-24.
//

import Foundation

/// Model representing a museum object from the British Museum API
struct MuseumObject: Codable, Identifiable {
    let objectID: Int
    let title: String
    let creditLine: String
    let objectURL: String
    let isPublicDomain: Bool
    let primaryImageSmall: String

    /// Unique ID required for SwiftUI List
    var id: Int { objectID }
}
