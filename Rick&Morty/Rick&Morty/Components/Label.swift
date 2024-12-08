//
//  Label.swift
//  Rick&Morty
//
//  Created by Леонид Турко on 07.12.2024.
//

import UIKit

enum LabelType {
  case character
}

class Label: UILabel {
  
  init(type: LabelType, text: String = "") {
    super.init(frame: .zero)
    commonInit(type, text)
  }
  
  
  func commonInit(_ type: LabelType, _ text: String = "") {
    switch type {
    case .character:
      self.text = text
      self.textColor = .white
      font = .systemFont(ofSize: 14, weight: .bold)
    }
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
