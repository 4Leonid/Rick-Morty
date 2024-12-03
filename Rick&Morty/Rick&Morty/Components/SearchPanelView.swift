//
//  SearchPanelView.swift
//  Rick&Morty
//
//  Created by Леонид Турко on 03.12.2024.
//

import UIKit

final class SearchPanelView: UIView {
  
  private let horizontalStackView = SearchHorizontalStackView()
  
  private let worldImageView = ImageView(type: .search)
  
  private lazy var textLabel: UILabel = {
    let element = UILabel()
    element.text = "Search by Planet"
    element.textAlignment = .center
    return element
  }()
  
  private let searchButton = Button(type: .search)
   
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setupViews()
    setupConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupViews() {
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
