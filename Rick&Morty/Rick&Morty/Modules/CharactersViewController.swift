//
//  CharactersViewController.swift
//  Rick&Morty
//
//  Created by Леонид Турко on 01.12.2024.
//

import UIKit
import SnapKit

final class CharactersViewController: UIViewController {
  
  private var charactersView = CharactersView()
  private let charactersLoader = CharactersLoader()
  
  var characters: [Character] = []
  var character: Character?
  var charactersInfo: [(key: String, value: String)] = []
  
  var characterId = 1
  
  func convertModelToKeyValuePairs(_ model: Character) -> [(key: String, value: String)] {
    
    let array: [(key: String, value: String)] = [("Planet: ", model.origin.name), ("Name: ", model.name), ("Status: ", model.status), ("Created: ", model.created)]
    
    return array
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupViews()
    setupConstraints()
    setBackgroundImage()
    
    setupObservers()
    
    //loadCharacters()
    loadCharacter(characterId)
  }
}

extension CharactersViewController {
  
  func loadCharacter(_ id: Int) {
    charactersLoader.loadCharacter(id: id) { [weak self] result in
      
      guard let self else { return }
      
      switch result {
        
      case .success(let character):
        self.character = character
        
        
        
        let characterInfo = self.convertModelToKeyValuePairs(character)
        
        self.charactersView.update(chararcter: character, charactersInfo: characterInfo)
        
      case .failure(let error):
        print(error)
      }
    }
  }
}

// MARK: - Layout
extension CharactersViewController {
  
  func setupObservers() {
     
    charactersView.infoButton.onButtonAction = {
      let detailVC = DetailsViewController()
      self.present(detailVC, animated: true)
    }
    
    charactersView.leftWhiteButton.onButtonAction = {
      self.characterId = self.characterId - 1 == 0 ? 826 : self.characterId - 1
      //self.charactersInfo.removeAll()
      self.loadCharacter(self.characterId)
    }
    
    charactersView.rightWhiteButton.onButtonAction = {
      self.characterId = self.characterId + 1 == 826 ? 1 : self.characterId + 1
      //self.charactersInfo.removeAll()
      self.loadCharacter(self.characterId)
    }
  }
  
  func setupViews() {
    view.backgroundColor = .orange
    view.addSubview(charactersView)
  }
  
  func setupConstraints() {
    charactersView.snp.makeConstraints { make in
      make.left.right.equalTo(view).inset(21)
      make.top.equalTo(view.safeAreaLayoutGuide).offset(69)
      make.bottom.equalTo(view.safeAreaLayoutGuide).inset(99)
    }
  }
}
