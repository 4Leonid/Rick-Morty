//
//  SearchPanelView.swift
//  Rick&Morty
//
//  Created by Леонид Турко on 03.12.2024.
//

import UIKit

final class SearchPanelView: UIView {
  
  private lazy var horizontalStackView = KeyValueStackView(type: .horizontal)
  private lazy var worldImageView = ImageView(type: .search)
  
  let textLabel = Label(type: .bold, text: "Search by planet")
  let searchButton = Button(type: .search)
   
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
    setupConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK: - Layout
private extension SearchPanelView {
  private func setupViews() {
    backgroundColor = .appGreen
    layer.cornerRadius = 16
    horizontalStackView.addArrangedSubview(worldImageView)
    horizontalStackView.addArrangedSubview(textLabel)
    horizontalStackView.addArrangedSubview(searchButton)
    addSubview(horizontalStackView)
  }
  
  private func setupConstraints() {
    horizontalStackView.snp.makeConstraints { make in
      make.centerY.equalTo(self)
      make.left.right.equalTo(self).inset(10)
    }
  }
}
