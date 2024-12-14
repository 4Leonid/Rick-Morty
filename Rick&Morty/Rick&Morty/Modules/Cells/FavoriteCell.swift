//
//  FavoriteCell.swift
//  Rick&Morty
//
//  Created by Леонид Турко on 03.12.2024.
//

import UIKit

final class FavoriteCell: UITableViewCell {
  
  var onFavoriteSelected: ((CharacterEntity)->())?
  var onInfoSelected: ((CharacterEntity)->())?
  
  private let favoriteImageView = ImageView(type: .favorite)
  private var keyValueStackView = KeyValueStackView(type: .horizontal)
  private var favoriteButton = Button(type: .favoriteActive)
  private let infoButton = Button(type: .info)
  
  private lazy var nameLabel = Label(type: .bold, text: "Name: Summer Smith")
  
  var character: CharacterEntity?
  
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupViews()
    setupConstraints()
    setupObservers()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK: - Public
extension FavoriteCell {
  func update(_ character: CharacterEntity) {
    self.character = character
    let url = URL(string: character.image ?? "")
    favoriteImageView.kf.setImage(with: url)
    nameLabel.text = "Name: \n\(character.name ?? "")"
  }
}

// MARK: - Observers
private extension FavoriteCell {
  func setupObservers() {
    favoriteButton.onButtonAction = { [weak self] in
      guard let self else { return }
      guard let character = self.character else { return }
      self.onFavoriteSelected?(character)
    }
    
    infoButton.onButtonAction = { [weak self] in
      guard let self else { return }
      guard let character = self.character else { return }
      self.onInfoSelected?(character)
    }
  }
}
// MARK: - Layout
private extension FavoriteCell {
  private func setupViews() {
    backgroundColor = .appBackground
    contentView.layer.cornerRadius = 10
    
    keyValueStackView.backgroundColor = .appGreen
    keyValueStackView.addArrangedSubview(nameLabel)
    
    favoriteImageView.addSubview(keyValueStackView)
    contentView.addSubview(favoriteImageView)
    contentView.addSubview(favoriteButton)
    contentView.addSubview(infoButton)
  }
  
  private func setupConstraints() {
    favoriteImageView.snp.makeConstraints { make in
      make.left.right.equalTo(contentView)
      make.top.bottom.equalTo(contentView).inset(10)
    }
    
    favoriteButton.snp.makeConstraints { make in
      make.top.left.equalTo(contentView).inset(10)
    }
    
    keyValueStackView.snp.makeConstraints { make in
      make.bottom.left.right.equalTo(favoriteImageView)
      make.height.equalTo(70)
    }
    
    nameLabel.snp.makeConstraints { make in
      make.left.right.equalTo(keyValueStackView).inset(10)
      make.centerY.equalTo(keyValueStackView.snp.centerY)
    }
    
    infoButton.snp.makeConstraints { make in
      make.right.equalTo(contentView)
      make.centerY.equalTo(keyValueStackView.snp.top)
    }
  }
}
