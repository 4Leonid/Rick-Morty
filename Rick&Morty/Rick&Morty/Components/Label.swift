//
//  Label.swift
//  Rick&Morty
//
//  Created by Леонид Турко on 07.12.2024.
//

import UIKit

enum LabelType {
  case character
  case bold
  case headline
}

final class Label: UILabel {
  init(type: LabelType, text: String = "") {
    super.init(frame: .zero)
    commonInit(type, text)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK: - Private 
private extension Label {
  func commonInit(_ type: LabelType, _ text: String = "") {
    switch type {
    case .character:
      self.text = text
      textColor = .white
      font = .systemFont(ofSize: 14, weight: .bold)
      numberOfLines = 0
    case .bold:
      self.text = text
      textColor = .black
      textAlignment = .left
      font = .systemFont(ofSize: 20, weight: .bold)
      numberOfLines = 0
    case .headline:
      self.text = text
      textColor = .white
      textAlignment = .left
      font = .systemFont(ofSize: 24, weight: .regular)
      numberOfLines = 0
    }
  }
}
