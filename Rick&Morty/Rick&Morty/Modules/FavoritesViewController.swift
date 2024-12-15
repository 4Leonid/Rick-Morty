//
//  FavoritesViewController.swift
//  Rick&Morty
//
//  Created by Леонид Турко on 03.12.2024.
//

import UIKit

final class FavoritesViewController: UIViewController {
  
  // MARK: - Private Properties
  private let characterStorage = CharacterStorage()
  private let charactersLoader = CharactersLoader()
  
  private lazy var favoritesView = FavoritesView()
  private lazy var headLineLabel = Label(type: .headline, text: "Favorites")
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupViews()
    setupConstraints()
    setupBackgroundImage()
    setupObservers()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    loadCharactersFromDatabase()
  }
  
  func loadCharactersFromDatabase() {
    let characters = characterStorage.fetchAllCharacters()
    
    favoritesView.update(characters)
  }
  
  func setupObservers() {
    favoritesView.onFavoriteCharSelected = { [weak self] character in
      
      guard let self else { return }
      self.characterStorage.delete(characterID: Int(character.id))
      loadCharactersFromDatabase()
    }
    
    favoritesView.onInfoSelected = { char in
      
      let id = Int(char.id)
      self.charactersLoader.loadCharacter(id: id, completion: { result in
        
        
        switch result {
        case .success(let character):
          let detailVC = DetailsViewController()
          
          self.present(detailVC, animated: true)
          detailVC.update(character)
          
        case .failure(let error):
          AlertService.shared.showAlert(
            title: "Error",
            message: error.localizedDescription,
            on: self
          )
        }
      })
    }
  }
}

// MARK: -

// MARK: - Layouts
private extension FavoritesViewController {
  func setupViews() {
    view.addSubview(favoritesView)
    view.addSubview(headLineLabel)
  }
  
  func setupConstraints() {
    
    headLineLabel.snp.makeConstraints { make in
      make.top.equalTo(view.safeAreaLayoutGuide).inset(16)
      make.centerX.equalTo(view.snp.centerX)
    }
    
    favoritesView.snp.makeConstraints { make in
      make.top.equalTo(view).offset(view.bounds.height * 0.15)
      make.left.right.equalTo(view).inset(21)
      make.centerY.equalTo(view.snp.centerY)
    }
  }
}



