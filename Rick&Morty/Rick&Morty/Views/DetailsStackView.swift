//
//  DetailSecondView.swift
//  Rick&Morty
//
//  Created by Леонид Турко on 02.12.2024.
//

import UIKit

final class DetailsStackView: UIView {
  
  // MARK: - Private Properties
  private let nameLabel = KeyValueLabel()
  private var keyValueStackView = KeyValueStackView()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setupViews()
    setupConstraints()
    
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Layout
  func setupViews() {
    
    backgroundColor = .systemGreen
    layer.borderWidth = 3
    layer.borderColor = UIColor.black.cgColor
    layer.cornerRadius = 37
    clipsToBounds = true
    
    for index in 0..<6 {
      let keyValueLabel = KeyValueLabel()
      let model = detailArrray[index]
      keyValueLabel.update(key: model.key, value: model.value)
      keyValueStackView.addArrangedSubview(keyValueLabel)
    }
    
    nameLabel.update(text: "Rick Sanchez")
    
    addSubview(nameLabel)
    addSubview(keyValueStackView)
  }
  
  func setupConstraints() {
    
    nameLabel.snp.makeConstraints { make in
      make.top.equalTo(self).offset(23)
      make.centerX.equalTo(self)
    }
    
    keyValueStackView.snp.makeConstraints { make in
      make.top.equalTo(nameLabel.snp.bottom).offset(10)
      make.left.right.equalTo(self).inset(18)
    }
    
  }
}
