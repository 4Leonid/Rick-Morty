//
//  NetworkClient.swift
//  Rick&Morty
//
//  Created by Леонид Турко on 14.12.2024.
//

import Foundation

enum NetworkError: Error {
  case invalidURL
  case invalidResponse
}

protocol INetworkClient {
  func fetch(url: URL?, completion: @escaping (Result<Data, Error>) -> Void)
}

struct NetworkClient: INetworkClient {
  
  func fetch(url: URL?, completion: @escaping (Result<Data, Error>) -> Void) {
    
    guard let url else {
      completion(.failure(NetworkError.invalidURL))
      return
    }
    let request = URLRequest(url: url)
    
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
      
      if let error = error {
        completion(.failure(error))
        return
      }
      
      if let response = response as? HTTPURLResponse,
         response.statusCode < 200 || response.statusCode >= 300 {
        
        completion(.failure(NetworkError.invalidResponse))
        return
      }
      
      guard let data = data else { return }
      completion(.success(data))
    }
    
    task.resume()
  }
}
