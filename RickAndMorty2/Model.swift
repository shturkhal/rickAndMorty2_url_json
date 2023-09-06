//
//  Model.swift
//  RickAndMorty2
//
//  Created by Іван Штурхаль on 15.08.2023.
//

import Foundation

// MARK: - RickAndMorty
struct RickAndMorty: Codable {
    let id: Int
    let name, status, species, type: String
    let gender: String
    let origin, location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

// MARK: - Location
struct Location: Codable {
    let name: String
    let url: String
}
