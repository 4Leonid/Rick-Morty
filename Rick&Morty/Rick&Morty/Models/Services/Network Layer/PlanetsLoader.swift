//
//  PlanetsLoader.swift
//  Rick&Morty
//
//  Created by Леонид Турко on 10.12.2024.
//

import Foundation

protocol IPlanetsLoader {
  func loadPlanets(completion: @escaping (Result<[Planet], Error>) -> Void)
}

final class PlanetsLoader: IPlanetsLoader {
  
  // MARK: - Private
  private let networkClient: INetworkClient
  private let decoder: JSONDecoder
  
  init(networkClient: INetworkClient = NetworkClient(), decoder: JSONDecoder = JSONDecoder()) {
    self.networkClient = networkClient
    self.decoder = decoder
  }
}

// MARK: - Public
extension PlanetsLoader {
  func loadPlanets(completion: @escaping (Result<[Planet], Error>) -> Void) {
    
    networkClient.fetch(url: createCharacterURL()) { result in
      switch result {
        
      case .success(let data):
        do {
          let planets = try self.decoder.decode(PlanetResponse.self, from: data)
          DispatchQueue.main.async {
            completion(.success(planets.results))
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
private extension PlanetsLoader {
  // MARK: - URL
  func createCharacterURL() -> URL? {
    var components = URLComponents()
    components.scheme = "https"
    components.host = "rickandmortyapi.com"
    components.path = "/api/location"
    return components.url
  }
}
