//
//  PlanetsLoader.swift
//  Rick&Morty
//
//  Created by Леонид Турко on 10.12.2024.
//

import Foundation

class PlanetsLoader {
  
  let session = URLSession.shared
  let decoder = JSONDecoder()
  
  func loadPlanets(completion: @escaping (Result<[Planet], Error>) -> Void) {
    
    let url = URL(string: "https://rickandmortyapi.com/api/location")!
    
    session.dataTask(with: url) { data, _, error in
      
      if error != nil {
        print(error as Any)
      }
      
      guard let data else { return }
      do {
        let response = try self.decoder.decode(PlanetResponse.self, from: data)
        
        DispatchQueue.main.async {
          completion(.success(response.results))
        }
      } catch {
        print(error)
      }
    }.resume()
  }
}
