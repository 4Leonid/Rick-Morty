//
//  SearchViewController.swift
//  Rick&Morty
//
//  Created by Леонид Турко on 02.12.2024.
//

import UIKit

final class SearchViewController: UIViewController {
  
  // MARK: - Private Properties
  private var planetsLoader = PlanetsLoader()
  private var charactersLoader = CharactersLoader()
  private var charactersStorage = CharacterStorage()
  
  private lazy var headLineLabel = Label(type: .headline, text: "Search")
  private lazy var searchView = SearchView()
  
  private var character: Character?
  private var characterId = 1
  private var residents: [String] = []
  private var residentIndex = 0
  private var planet: Planet?
  
  // MARK: - Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setupViews()
    setupConstraints()
    setupBackgroundImage()
    loadCharacter(characterId)
    setupObservers()
  }
}

// MARK: - Business Logic
extension SearchViewController {
  func loadCharacter(_ id: Int) {
    charactersLoader.loadCharacter(id: id) { [weak self] result in
      guard let self else { return }
      switch result {
      case .success(let character):
        self.character = character
        self.characterId = character.id
        if charactersStorage.isCharacterExists(characterID: characterId) {
          searchView.favoriteButton.isSelected = true
        } else {
          searchView.favoriteButton.isSelected = false
        }
        self.searchView.update(character)
      case .failure(let error):
        print(error)
      }
    }
  }
}

// MARK: - Observers
private extension SearchViewController {
  func setupObservers() {
    searchView.infoButton.onButtonAction = { [weak self] in
      guard let self else { return }
      let detailVC = DetailsViewController()
      self.present(detailVC, animated: true)
      guard let character = self.character else { return }
      detailVC.update(character)
    }
    
    searchView.searchPanelView.searchButton.onButtonAction = { [weak self] in
      guard let self else { return }
      self.loadPlanets()
    }
    
    searchView.favoriteButton.onButtonAction = { [weak self] in
      guard let self else { return }
      self.searchView.favoriteButton.isSelected.toggle()
      guard let character = self.character else { return }
      if self.searchView.favoriteButton.isSelected {
        charactersStorage.save(character: character)
      } else {
        charactersStorage.delete(characterID: characterId)
      }
    }
    
    searchView.leftGreenButton.onButtonAction = { [weak self] in
      guard let self else { return }
      self.residentIndex -= 1
      self.residentIndex = self.residentIndex < 0 ? self.residents.count - 1 : self.residentIndex
      self.loadCharacterByPlanet(self.planet)
    }
    
    searchView.rightGreenButton.onButtonAction = {
      self.residentIndex += 1
      self.residentIndex = self.residentIndex > self.residents.count - 1 ? 0 : self.residentIndex
      self.loadCharacterByPlanet(self.planet)
      
    }
  }
}

//MARK: - Navigation
private extension SearchViewController {
  func navigateToPlanetsScreen(_ planets: [Planet]) {
    let planetsViewController = PlanetsViewController()
    
    planetsViewController.onPlanetSelected = { [weak self] planet in
      guard let self else { return }
      self.residentIndex = 0
      self.planet = planet
      self.searchView.searchPanelView.textLabel.text = "Search by \(planet.name)"
      loadCharacterByPlanet(planet)
    }
    
    self.present(planetsViewController, animated: true)
    planetsViewController.update(planets)
  }
}

//MARK: - Business Logic
private extension SearchViewController {
  func loadPlanets() {
    planetsLoader.loadPlanets { result in
      switch result {
      case .success(let planets):
        self.navigateToPlanetsScreen(planets)
        
      case .failure(let error):
        print(error)
      }
    }
  }
  
  func loadCharacterByPlanet(_ planet: Planet?) {
    guard let planet else { return }
    guard planet.residents.isNotEmpty else { return }
    residents = planet.residents
    let resident = residents[residentIndex]
    let components = resident.components(separatedBy: "/")
    
    if let id = components.last, let id = Int(id) {
      charactersLoader.loadCharacter(id: id) { result in
        switch result {
          
        case .success(let character):
          self.character = character
          self.characterId = character.id
          
          if self.charactersStorage.isCharacterExists(characterID: self.characterId) {
            self.searchView.favoriteButton.isSelected = true
          } else {
            self.searchView.favoriteButton.isSelected = false
          }
          self.searchView.update(character)
          
        case .failure(let error):
          print(error)
        }
      }
    }
  }
}

// MARK: - Layout
private extension SearchViewController {
  func setupViews() {
    view.backgroundColor = .orange
    view.addSubview(searchView)
    view.addSubview(headLineLabel)
  }
  
  func setupConstraints() {
    
    headLineLabel.snp.makeConstraints { make in
      make.top.equalTo(view.safeAreaLayoutGuide).inset(16)
      make.centerX.equalTo(view.snp.centerX)
    }
    
    searchView.snp.makeConstraints { make in
      make.top.equalTo(view).offset(view.bounds.height * 0.15)
      make.left.right.equalTo(view).inset(21)
      make.centerY.equalTo(view.snp.centerY)
    }
  }
}
