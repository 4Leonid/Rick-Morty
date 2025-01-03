//
//  KeyValueStackView.swift
//  Rick&Morty
//
//  Created by Леонид Турко on 01.12.2024.
//

import UIKit

enum StackViewType {
  case horizontal
  case vertical
}

final class KeyValueStackView: UIStackView {
  
  init(type: StackViewType) {
    super.init(frame: .zero)
    commonInit(type)
  }
  
  required init(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

private extension KeyValueStackView {
  func commonInit(_ type: StackViewType) {
    switch type {
    case .horizontal:
      axis = .horizontal
      alignment = .center
      spacing = 10
    case .vertical:
      axis = .vertical
      alignment = .leading
      distribution = .fillEqually
      spacing = 2
    }
  }
}
