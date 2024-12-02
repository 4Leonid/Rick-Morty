//
//  CharactersView.swift
//  Rick&Morty
//
//  Created by Леонид Турко on 01.12.2024.
//

import UIKit

enum ImageType: Int, CaseIterable {
  case card
  case detail
  //    case search
  //    case favorites
  //    case star
  //    case info
}

class ImageView: UIImageView {
  
  init(type: ImageType) {
    super.init(frame: .zero)
    
    switch type {
    case .card:
      heightAnchor.constraint(equalToConstant: 325).isActive = true
      layer.cornerRadius = 32
      image = UIImage(named: "default")
      clipsToBounds = true
    case .detail:
      heightAnchor.constraint(equalToConstant: 325).isActive = true
      layer.cornerRadius = 41
      image = UIImage(named: "detail")
      clipsToBounds = true
    }
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}

class DetailsView: UIView {
  private var keyValueStackView = KeyValueStackView()
  private var detailImageView = ImageView(type: .detail)
  
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
    
    addSubview(detailImageView)
  }
  
  func setupConstraints() {
//    keyValueStackView.snp.makeConstraints { make in
//      make.top.left.right.equalTo(self).inset(39)
//    }
    
    detailImageView.snp.makeConstraints { make in
      make.top.equalTo(self).inset(25)
      make.left.right.equalTo(self).inset(18)
      make.height.equalTo(155)
    }
    
    keyValueStackView.snp.makeConstraints { make in
      make.top.equalTo(detailImageView).inset(24)
      make.left.right.equalTo(self).inset(18)
    }
    
//    detailImageView.snp.makeConstraints { make in
//      make.top.equalTo(keyValueStackView.snp.bottom).offset(24)
//      make.left.right.equalTo(self).inset(24)
//    }
  }
}

class CharactersView: UIView {
  
  private var keyValueStackView = KeyValueStackView()
  private var cardImageView = ImageView(type: .card)
  
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
  }
  
  func setupConstraints() {
    keyValueStackView.snp.makeConstraints { make in
      make.top.left.right.equalTo(self).inset(39)
    }
    
    cardImageView.snp.makeConstraints { make in
      make.top.equalTo(keyValueStackView.snp.bottom).offset(24)
      make.left.right.equalTo(self).inset(24)
    }
  }
  
}
