//
//  CharactersView.swift
//  Rick&Morty
//
//  Created by Леонид Турко on 01.12.2024.
//

import UIKit
import Kingfisher

final class CharactersView: UIView {
  
  // MARK: - Private properties
  private var planetLabel = Label(type: .character)
  private var nameLabel = Label(type: .character)
  private var statusLabel = Label(type: .character)
  private var createdLabel = Label(type: .character)
  
  private var keyValueStackView = KeyValueStackView()
  private var cardImageView = ImageView(type: .card)
  
  private var favoriteButton = Button(type: .favorite)
  var infoButton = Button(type: .info)
  
  let leftWhiteButton = Button(type: .leftWhite)
  let rightWhiteButton = Button(type: .rightWhite)
  
  var charactersInfo: [(key: String, value: String)] = []
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func update(chararcter: Character, charactersInfo:
              [(key: String, value: String)]) {
    let url = URL(string: chararcter.image)
    cardImageView.kf.setImage(with: url)
    planetLabel.text = "Planet: \(chararcter.location.name)"
    nameLabel.text = "Name: \(chararcter.name)"
    statusLabel.text = "Status: \(chararcter.status)"
    createdLabel.text = "Created: \(chararcter.created)"
    setupViews()
    setupConstraints()
  }
  
  // MARK: - Layout
  func setupViews() {
    backgroundColor = .systemMint
    layer.cornerRadius = 42
    clipsToBounds = false
    
    keyValueStackView.addArrangedSubview(planetLabel)
    keyValueStackView.addArrangedSubview(nameLabel)
    keyValueStackView.addArrangedSubview(statusLabel)
    keyValueStackView.addArrangedSubview(createdLabel)
    
    addSubview(keyValueStackView)
    addSubview(cardImageView)
    addSubview(favoriteButton)
    addSubview(infoButton)
    addSubview(leftWhiteButton)
    addSubview(rightWhiteButton)
    
  }
  
  func setupConstraints() {
    keyValueStackView.snp.makeConstraints { make in
      make.top.left.right.equalTo(self).inset(39)
    }
    
    
    cardImageView.snp.makeConstraints { make in
      make.top.equalTo(keyValueStackView.snp.bottom).offset(24)
      make.left.right.equalTo(self).inset(24)
    }
    
    favoriteButton.snp.makeConstraints { make in
      make.left.equalTo(cardImageView.snp.left).inset(9)
      make.top.equalTo(cardImageView.snp.top).inset(13)
    }
    
    infoButton.snp.makeConstraints { make in
      make.right.equalTo(cardImageView.snp.right)
      make.bottom.equalTo(cardImageView.snp.bottom)
    }
    
    leftWhiteButton.snp.makeConstraints { make in
      make.top.equalTo(cardImageView.snp.bottom).offset(18)
      make.left.equalTo(self).inset(72)
    }
    
    rightWhiteButton.snp.makeConstraints { make in
      make.top.equalTo(cardImageView.snp.bottom).offset(18)
      make.right.equalTo(self).inset(72)
    }
  }
}
