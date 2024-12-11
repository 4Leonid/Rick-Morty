//
//  FavoritesView.swift
//  Rick&Morty
//
//  Created by Леонид Турко on 03.12.2024.
//

import UIKit
import CoreData

final class FavoritesView: UIView {
  
  var characters: [CharacterEntity] = []
  
  var onFavoriteCharSelected: ((CharacterEntity) -> Void)?
  var onInfoSelected: ((CharacterEntity) -> Void)?
  
  lazy var tableView: UITableView = {
    
    let tableView = UITableView()
    tableView.backgroundColor = .appBackground
    tableView.delegate = self
    tableView.dataSource = self
    tableView.backgroundColor = .systemBackground
    tableView.separatorStyle = .none
    tableView.layer.cornerRadius = 21
    tableView.registerCell(FavoriteCell.self)
    
    return tableView
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setupViews()
    setupConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func update(_ characters: [CharacterEntity]) {
    self.characters = characters
    
    tableView.reloadData()
  }
}

// MARK: - UITableViewDataSource
extension FavoritesView: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    characters.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueCell(indexPath) as FavoriteCell
    
    cell.onFavoriteSelected = { [weak self] character in
      
      guard let self else { return }
      
      self.onFavoriteCharSelected?(character)
    }
    
    cell.onInfoSelected = { character in
      self.onInfoSelected?(character)
    }
    
    let character = characters[indexPath.row]
    cell.update(character)
    return cell
  }
}

// MARK: - UITableViewDelegate
extension FavoritesView: UITableViewDelegate {
  
}

private extension FavoritesView {
  
  func setupViews() {
    backgroundColor = .appBackground
    layer.cornerRadius = 42
    addSubview(tableView)
  }
  
  func setupConstraints() {
    tableView.snp.makeConstraints { make in
      make.edges.equalToSuperview().inset(23)
    }
  }
}
