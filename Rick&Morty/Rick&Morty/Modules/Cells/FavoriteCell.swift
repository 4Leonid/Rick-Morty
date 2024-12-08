//
//  FavoriteCell.swift
//  Rick&Morty
//
//  Created by Леонид Турко on 03.12.2024.
//

import UIKit

class FavoriteCell: UITableViewCell {
  
  private let favoriteImageView = ImageView(type: .favorite)
  private var keyValueStackView = KeyValueStackView()
  
  private let favoriteButton = Button(type: .favoriteActive)
  private let infoButton = Button(type: .info)
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    setupViews()
    setupConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension FavoriteCell {
  
  private func setupViews() {
    contentView.backgroundColor = .black
    
    favoriteImageView.addSubview(keyValueStackView)
    favoriteImageView.addSubview(favoriteButton)
    favoriteImageView.addSubview(infoButton)
    
    contentView.addSubview(favoriteImageView)
  }
  
  private func setupConstraints() {
    favoriteImageView.snp.makeConstraints { make in
      make.left.right.equalToSuperview()
      make.top.bottom.equalToSuperview().inset(10)
    }
    
    favoriteButton.snp.makeConstraints { make in
      make.top.left.equalToSuperview().inset(10)
    }
    
    keyValueStackView.snp.makeConstraints { make in
      make.bottom.left.right.equalTo(favoriteImageView)
      make.height.equalTo(70)
    }
    
    infoButton.snp.makeConstraints { make in
      make.right.equalTo(favoriteImageView.snp.right)
      make.centerY.equalTo(keyValueStackView.snp.top)
    }
  }
}
