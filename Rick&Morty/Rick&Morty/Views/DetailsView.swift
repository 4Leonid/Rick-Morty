//
//  DetailsView.swift
//  Rick&Morty
//
//  Created by Леонид Турко on 02.12.2024.
//

import UIKit

final class DetailsView: UIView {
  
  // MARK: - Private Properties
  private var detailImageView = ImageView(type: .detail)
  private let detailTextView = DetailsStackView()
  
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
    backgroundColor = .white
    layer.cornerRadius = 42
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
