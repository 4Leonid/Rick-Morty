//
//  CharactersViewController.swift
//  Rick&Morty
//
//  Created by Леонид Турко on 01.12.2024.
//

import UIKit
import SnapKit

final class CharactersViewController: UIViewController {
  
  // MARK: - Private Properties
  private let charactersLoader = CharactersLoader()
  private let characterStorage = CharacterStorage()
  
  private lazy var headLineLabel = Label(type: .headline, text: "Characters")
  private lazy var charactersView = CharactersView()
 
  // MARK: - Public Properties
  var characters: [Character] = []
  var character: Character?
  var charactersInfo: [(key: String, value: String)] = []
  var characterId = 1
  
  // MARK: - Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setupViews()
    setupConstraints()
    setupBackgroundImage()
    setupObservers()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    loadCharacter(characterId)
  }
}

// MARK: - Business Logic
private extension CharactersViewController {
  private func convertModelToKeyValuePairs(_ model: Character) -> [(key: String, value: String)] {
    let array: [(key: String, value: String)] = [
      ("Planet: ", model.origin.name),
      ("Name: ", model.name),
      ("Status: ", model.status),
      ("Created: ", model.created)
    ]
    return array
  }
  
  func loadCharacter(_ id: Int) {
    charactersLoader.loadCharacter(id: id) { [weak self] result in
      
      guard let self else { return }
      
      switch result {
      case .success(let character):
        self.character = character
        let characterInfo = self.convertModelToKeyValuePairs(character)
        self.charactersView.update(chararcter: character, charactersInfo: characterInfo)
        
        if characterStorage.isCharacterExists(characterID: characterId) {
          charactersView.favoriteButton.isSelected = true
        } else {
          charactersView.favoriteButton.isSelected = false
        }
        
      case .failure(let error):
        AlertService.shared.showAlert(
          title: "Error",
          message: error.localizedDescription,
          on: self
        )
      }
    }
  }
}

// MARK: - Observers
private extension CharactersViewController {
  func setupObservers() {
    charactersView.infoButton.onButtonAction = {
      let detailVC = DetailsViewController()
      self.present(detailVC, animated: true)
      guard let character = self.character else { return }
      detailVC.update(character)
    }
    
    charactersView.leftWhiteButton.onButtonAction = {
      self.characterId = self.characterId - 1 == 0 ? 826 : self.characterId - 1
      self.loadCharacter(self.characterId)
    }
    
    charactersView.rightWhiteButton.onButtonAction = {
      self.characterId = self.characterId + 1 == 826 ? 1 : self.characterId + 1
      self.loadCharacter(self.characterId)
    }
    
    charactersView.favoriteButton.onButtonAction = { [weak self] in
      guard let self else { return }
      self.charactersView.favoriteButton.isSelected.toggle()
      guard let character = self.character else { return }
      if self.charactersView.favoriteButton.isSelected {
        characterStorage.save(character: character)
      } else {
        characterStorage.delete(characterID: characterId)
      }
    }
  }
}

// MARK: - Layouts
private extension CharactersViewController {
  func setupViews() {
    view.addSubview(headLineLabel)
    view.addSubview(charactersView)
  }
  
  func setupConstraints() {
    headLineLabel.snp.makeConstraints { make in
      make.top.equalTo(view.safeAreaLayoutGuide).inset(16)
      make.centerX.equalTo(view.snp.centerX)
    }
    
    charactersView.snp.makeConstraints { make in
      make.top.equalTo(view).offset(view.bounds.height * 0.15)
      make.left.right.equalTo(view).inset(21)
      make.centerY.equalTo(view.snp.centerY)
    }
  }
}
