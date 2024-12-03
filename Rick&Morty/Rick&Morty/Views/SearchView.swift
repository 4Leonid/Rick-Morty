//
//  SearchView.swift
//  Rick&Morty
//
//  Created by Леонид Турко on 02.12.2024.
//

import UIKit

class SearchView: UIView {
  
  private let emptyView = SearchPanelView()
  
  private var keyValueStackView = KeyValueStackView()
  private var cardImageView = ImageView(type: .card)
  
  private var favoriteButton = Button(type: .favorite)
  private var infoButton = Button(type: .info)
  
  private let leftGreenButton = Button(type: .leftGreen)
  private let rightGreenButton = Button(type: .rightGreen)
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setupViews()
    setupConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setupViews() {
    backgroundColor = .black
    layer.cornerRadius = 42
    clipsToBounds = false
    
    addSubview(keyValueStackView)
    
    for index in 0..<4 {
      let keyValueLabel = KeyValueLabel()
      let model = array[index]
      keyValueLabel.update(key: model.key, value: model.value)
      keyValueStackView.addArrangedSubview(keyValueLabel)
    }
    
    emptyView.backgroundColor = .green
    
    cardImageView.addSubview(keyValueStackView)
    addSubview(emptyView)
    addSubview(cardImageView)
    addSubview(favoriteButton)
    addSubview(infoButton)
    addSubview(leftGreenButton)
    addSubview(rightGreenButton)
    
  }
  
  func setupConstraints() {
    
    emptyView.snp.makeConstraints { make in
      make.top.equalTo(self).offset(46)
      make.left.right.equalTo(self).inset(24)
      make.height.equalTo(57)
    }
    
    keyValueStackView.snp.makeConstraints { make in
      make.bottom.left.right.equalTo(cardImageView)
      make.height.equalTo(100)
    }
    
    cardImageView.snp.makeConstraints { make in
      make.top.equalTo(emptyView.snp.bottom).offset(42)
      make.left.right.equalTo(self).inset(24)
    }
    
    favoriteButton.snp.makeConstraints { make in
      make.left.equalTo(cardImageView.snp.left).inset(9)
      make.top.equalTo(cardImageView.snp.top).inset(13)
    }
    
    infoButton.snp.makeConstraints { make in
      make.right.equalTo(cardImageView.snp.right)
      //make.bottom.equalTo(cardImageView.snp.bottom)
      make.centerY.equalTo(keyValueStackView.snp.top)
    }
    
    leftGreenButton.snp.makeConstraints { make in
      make.top.equalTo(cardImageView.snp.bottom).offset(18)
      make.left.equalTo(self).inset(72)
    }
    
    rightGreenButton.snp.makeConstraints { make in
      make.top.equalTo(cardImageView.snp.bottom).offset(18)
      make.right.equalTo(self).inset(72)
    }
  }
}
