//
//  DetailsView.swift
//  Rick&Morty
//
//  Created by Леонид Турко on 02.12.2024.
//

import UIKit

final class DetailsView: UIView {
  
  // MARK: - Private Properties
  private lazy var detailImageView = ImageView(type: .detail)
  private lazy var detailTextView = DetailsStackView()
  private lazy var model = convertModelToKeyValuePairs(character)
  private var character: Character?
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
    setupConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK: - Public
extension DetailsView {
  func update(_ character: Character) {
    self.character = character
    let url = URL(string: character.image)
    detailImageView.kf.setImage(with: url)
    detailTextView.update(model, character.name)
  }
}

// MARK: - Business Logic
private extension DetailsView {
  func convertModelToKeyValuePairs(_ model: Character?) -> [(key: String, value: String)] {
    
    guard let model = model else { return [] }
    
    let array: [(key: String, value: String)] = [
      ("ID: ", "\(model.id)"),
      ("Status: ", model.status),
      ("Species: ", model.species),
      ("Gender: ", model.gender),
      ("Origin: ", model.origin.name),
      ("Planet: ", model.origin.name)
    ]
    
    return array
  }
}

// MARK: - Layout
private extension DetailsView {
  func setupViews() {
    backgroundColor = .white
    layer.cornerRadius = 42
    layer.borderWidth = 3
    layer.borderColor = UIColor.appGreen.cgColor
    clipsToBounds = false
    
    addSubview(detailImageView)
    addSubview(detailTextView)
  }
  
  func setupConstraints() {
    detailImageView.snp.makeConstraints { make in
      make.top.equalTo(self).inset(25)
      make.left.right.equalTo(self).inset(18)
      make.height.equalTo(155)
    }
    
    detailTextView.snp.makeConstraints { make in
      make.top.equalTo(detailImageView.snp.bottom).offset(24)
      make.left.right.equalTo(self).inset(18)
      make.bottom.equalTo(self).inset(44)
    }
  }
}
