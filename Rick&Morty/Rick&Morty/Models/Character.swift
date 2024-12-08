//
//  Character.swift
//  Rick&Morty
//
//  Created by Леонид Турко on 07.12.2024.
//

import Foundation

struct CharactersResponse: Decodable {
  let info: Info
  let results: [Character]
}

struct Info: Decodable {
  let count: Int
  let pages: Int
  let next: String?
  let prev: String?
}

struct Character: Decodable {
  let id: Int
  let name: String
  let status: String
  let species: String
  let type: String
  let gender: String
  let origin: Origin
  let location: Location
  let image: String
  let episode: [String]
  let url: String
  let created: String
}

struct Origin: Decodable {
  let name: String
  let url: String
}

struct Location: Decodable {
  let name: String
  let url: String
}

