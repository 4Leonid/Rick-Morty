//
//  Location.swift
//  Rick&Morty
//
//  Created by Леонид Турко on 10.12.2024.
//

import Foundation

// MARK: - Main API Response
struct PlanetResponse: Decodable {
    let info: Info
    let results: [Planet]
}

// MARK: - Location
struct Planet: Decodable {
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
    let url: String
    let created: String
}
