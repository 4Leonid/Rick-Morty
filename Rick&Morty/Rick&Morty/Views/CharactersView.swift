//
//  CharactersView.swift
//  Rick&Morty
//
//  Created by Леонид Турко on 01.12.2024.
//

import UIKit

class CharactersView: UIView {
  
  private var keyValueStackView = KeyValueStackView()
  private var cardImageView = ImageView(type: .card)
  
  private var favoriteButton = Button(type: .favorite)
  private var infoButton = Button(type: .info)
  
  private let leftWhiteButton = Button(type: .leftWhite)
  private let rightWhiteButton = Button(type: .rightWhite)
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setupViews()
    setupConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setupViews() {
    backgroundColor = .systemMint
    layer.cornerRadius = 42
    clipsToBounds = false
    
    addSubview(keyValueStackView)
    
    for index in 0..<4 {
      let keyValueLabel = KeyValueLabel()
      let model = array[index]
      keyValueLabel.update(key: model.key, value: model.value)
      keyValueStackView.addArrangedSubview(keyValueLabel)
    }
    
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
