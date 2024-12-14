//
//  CharactersLoader.swift
//  Rick&Morty
//
//  Created by Леонид Турко on 07.12.2024.
//

import Foundation

enum NetworkError: Error {
  case invalidURL
  case invalidResponse
}

class CharactersLoader {
  
  let session = URLSession.shared
  let decoder = JSONDecoder()
  var components = URLComponents()
  
  
  func loadCharacters(completion: @escaping (Result<[Character], Error>) -> Void) {
    
    
    components.scheme = "https"
    components.host = "rickandmortyapi.com"
    components.path = "/api/character/1"
    
    guard let url = components.url else { return }
    
    session.dataTask(with: url) { data, _, error in
      
      if error != nil {
        completion(.failure(NetworkError.invalidResponse))
      }
      
      guard let data else { return }
        do {
          let response = try self.decoder.decode(CharactersResponse.self, from: data)
          
          DispatchQueue.main.async {
            completion(.success(response.results))
          }
        } catch {
          print(error)
        }
    }.resume()
  }
  
  func loadCharacter(id: Int, completion: @escaping (Result<Character, Error>) -> Void) {
    let url = URL(string: "https://rickandmortyapi.com/api/character/\(id)")!
    
    session.dataTask(with: url) { data, _, error in
      
      if error != nil {
        completion(.failure(NetworkError.invalidResponse))
      }
      
      guard let data else { return }
        do {
          let character = try self.decoder.decode(Character.self, from: data)
          
          DispatchQueue.main.async {
            completion(.success(character))
          }
        } catch {
          print(error)
        }
    }.resume()
  }
}
