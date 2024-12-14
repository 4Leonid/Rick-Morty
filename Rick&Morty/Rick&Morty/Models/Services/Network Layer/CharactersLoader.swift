//
//  CharactersLoader.swift
//  Rick&Morty
//
//  Created by Леонид Турко on 07.12.2024.
//

import Foundation

protocol ICharactersLoader {
  func loadCharacter(id: Int, completion: @escaping (Result<Character, Error>) -> Void)
}

struct CharactersLoader: ICharactersLoader {
  
  // MARK: - Private
  private let networkClient: INetworkClient
  private let decoder: JSONDecoder
  
  init(networkClient: INetworkClient = NetworkClient(), decoder: JSONDecoder = JSONDecoder()) {
    self.networkClient = networkClient
    self.decoder = decoder
  }
}

// MARK: - Public
extension CharactersLoader {
  func loadCharacter(id: Int, completion: @escaping (Result<Character, Error>) -> Void) {
    
    networkClient.fetch(url: createCharacterURL(id)) { result in
      switch result {
      case .success(let data):
        
        do {
          let character = try self.decoder.decode(Character.self, from: data)
          DispatchQueue.main.async {
            completion(.success(character))
          }
        } catch {
          completion(.failure(error))
        }
        
      case .failure(let error):
        completion(.failure(error))
      }
    }
  }
}

// MARK: - Private
private extension CharactersLoader {
  // MARK: - URL
  private func createCharacterURL(_ characterID: Int) -> URL? {
    var components = URLComponents()
    components.scheme = "https"
    components.host = "rickandmortyapi.com"
    components.path = "/api/character/\(characterID)"
    return components.url
  }
}
