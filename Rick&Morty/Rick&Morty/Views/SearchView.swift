//
//  SearchView.swift
//  Rick&Morty
//
//  Created by Леонид Турко on 02.12.2024.
//

import UIKit

class SearchView: UIView {
  
  var searchPanelView = SearchPanelView()
  
  
  private var cardImageView = ImageView(type: .card)
  
  private var planetLabel = Label(type: .bold, text: "Planet: Earth")
  private var nameLabel = Label(type: .bold, text: "Name: Rick")
  
  private var keyValueStackView = KeyValueStackView(type: .horizontal)
  
  
  var favoriteButton = Button(type: .favorite)
  var infoButton = Button(type: .info)
  
  var leftGreenButton = Button(type: .leftGreen)
  var rightGreenButton = Button(type: .rightGreen)
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setupViews()
    setupConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setupViews() {
    backgroundColor = .appBackground
    layer.cornerRadius = 42
    clipsToBounds = false
    
    keyValueStackView.backgroundColor = .appGreen
    keyValueStackView.addArrangedSubview(planetLabel)
    keyValueStackView.addArrangedSubview(nameLabel)
    
    addSubview(keyValueStackView)
    cardImageView.addSubview(keyValueStackView)
    addSubview(searchPanelView)
    addSubview(cardImageView)
    addSubview(favoriteButton)
    addSubview(infoButton)
    addSubview(leftGreenButton)
    addSubview(rightGreenButton)
    
  }
  
  func update(_ character: Character) {
    let url = URL(string: character.image)
    cardImageView.kf.setImage(with: url)
    
    
    planetLabel.text = "Planet: \n\(character.location.name)"
    nameLabel.text = "Name: \n\(character.name)"
  }
  
  func setupConstraints() {
    
    searchPanelView.snp.makeConstraints { make in
      make.top.equalTo(self).offset(46)
      make.left.right.equalTo(self).inset(24)
      make.height.equalTo(57)
    }
    
    keyValueStackView.snp.makeConstraints { make in
      make.bottom.left.right.equalTo(cardImageView)
      make.height.equalTo(100)
    }
    
    cardImageView.snp.makeConstraints { make in
      make.top.equalTo(searchPanelView.snp.bottom).offset(42)
      make.left.right.equalTo(self).inset(24)
    }
    
    favoriteButton.snp.makeConstraints { make in
      make.left.equalTo(cardImageView.snp.left).inset(9)
      make.top.equalTo(cardImageView.snp.top).inset(13)
    }
    
    infoButton.snp.makeConstraints { make in
      make.right.equalTo(cardImageView.snp.right)
      make.centerY.equalTo(keyValueStackView.snp.top)
    }
    
    leftGreenButton.snp.makeConstraints { make in
      
      make.top.equalTo(cardImageView.snp.bottom).offset(18)
      make.left.equalTo(self).inset(72)
      make.bottom.equalTo(self).inset(8)
    }
    
    rightGreenButton.snp.makeConstraints { make in
      make.top.equalTo(cardImageView.snp.bottom).offset(18)
      make.right.equalTo(self).inset(72)
      make.bottom.equalTo(self).inset(8)
    }
    
    planetLabel.snp.makeConstraints { make in
      make.left.right.equalTo(keyValueStackView).inset(16)
    }
  }
}
