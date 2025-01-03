//
//  DetailSecondView.swift
//  Rick&Morty
//
//  Created by Леонид Турко on 02.12.2024.
//

import UIKit

final class DetailsStackView: UIView {
  
  var modelInfo: [(key: String, value: String)] = [] {
    didSet {
      setupViews()
      setupConstraints()
    }
  }
  
  // MARK: - Private Properties
  private let nameLabel = KeyValueLabel()
  private var keyValueStackView = KeyValueStackView(type: .vertical)
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK: - Public
extension DetailsStackView {
  func update(_ model: [(key: String, value: String)], _ name: String) {
    self.modelInfo = model
    nameLabel.update(text: name)
  }
}

// MARK: - Layout
private extension DetailsStackView {
  func setupViews() {
    backgroundColor = .systemGreen
    layer.borderWidth = 3
    layer.borderColor = UIColor.black.cgColor
    layer.cornerRadius = 37
    clipsToBounds = true
    
    for index in 0..<6 {
      let keyValueLabel = KeyValueLabel()
      let model = modelInfo[index]
      keyValueLabel.update(key: model.key, value: model.value)
      keyValueStackView.addArrangedSubview(keyValueLabel)
    }
    
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
