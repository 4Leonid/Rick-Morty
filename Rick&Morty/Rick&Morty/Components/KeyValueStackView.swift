//
//  KeyValueStackView.swift
//  Rick&Morty
//
//  Created by Леонид Турко on 01.12.2024.
//

import UIKit

final class KeyValueStackView: UIStackView {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    commonInit()
  }
  
  required init(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func commonInit() {
    axis = .vertical
    alignment = .leading
    distribution = .fillEqually
    spacing = 2
  }
}

class SearchHorizontalStackView: UIStackView {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    commonInit()

  }
  
  required  init(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func commonInit() {
    axis = .horizontal
    alignment = .center
    spacing = 10
  }
}

