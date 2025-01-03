//
//  Button.swift
//  Rick&Morty
//
//  Created by Леонид Турко on 02.12.2024.
//

import UIKit

enum ButtonStyle {
  case favorite
  case favoriteActive
  case info
  case leftWhite
  case rightWhite
  case leftGreen
  case rightGreen
  case search
}

final class Button: UIButton {
  var onButtonAction: (() -> Void)?
  init(type: ButtonStyle) {
    super.init(frame: .zero)
    commonInit(type)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func commonInit(_ type: ButtonStyle) {
    
    addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    
    switch type {
    case .favorite:
      makeFavoriteStyle()
    case .info:
      makeInfoStyle()
    case .favoriteActive:
      makeFavoriteActiveStyle()
    case .leftWhite:
      makeLeftWhiteStyle()
    case .rightWhite:
      makeRightWhiteStyle()
    case .leftGreen:
      makeLeftGreenStyle()
    case .rightGreen:
      makeRightGreenStyle()
    case .search:
      makeSearchStyle()
    }
  }
}

// MARK: - Styles
private extension Button {
  func makeInfoStyle() {
    widthAnchor.constraint(equalToConstant: 63).isActive = true
    heightAnchor.constraint(equalToConstant: 63).isActive = true
    setImage(UIImage(named: "info"), for: .normal)
    backgroundColor = .white
    layer.cornerRadius = 31.5
    clipsToBounds = true
  }
  
  func makeFavoriteStyle() {
    widthAnchor.constraint(equalToConstant: 61).isActive = true
    heightAnchor.constraint(equalToConstant: 54).isActive = true
    setImage(UIImage(named: "Star 1"), for: .normal)
    setImage(UIImage(named: "Star 2"), for: .selected)
  }
  
  func makeFavoriteActiveStyle() {
    widthAnchor.constraint(equalToConstant: 61).isActive = true
    heightAnchor.constraint(equalToConstant: 54).isActive = true
    setImage(UIImage(named: "Star 2"), for: .normal)
  }
  
  func makeLeftWhiteStyle() {
    widthAnchor.constraint(equalToConstant: 35).isActive = true
    heightAnchor.constraint(equalToConstant: 62).isActive = true
    setImage(UIImage(named: "leftWhite"), for: .normal)
  }
  
  func makeRightWhiteStyle() {
    widthAnchor.constraint(equalToConstant: 35).isActive = true
    heightAnchor.constraint(equalToConstant: 62).isActive = true
    setImage(UIImage(named: "rightWhite"), for: .normal)
  }
  
  func makeLeftGreenStyle() {
    widthAnchor.constraint(equalToConstant: 35).isActive = true
    heightAnchor.constraint(equalToConstant: 62).isActive = true
    setImage(UIImage(named: "leftGreen"), for: .normal)
  }
  
  func makeRightGreenStyle() {
    widthAnchor.constraint(equalToConstant: 35).isActive = true
    heightAnchor.constraint(equalToConstant: 62).isActive = true
    setImage(UIImage(named: "rightGreen"), for: .normal)
  }
  
  func makeSearchStyle() {
    widthAnchor.constraint(equalToConstant: 30).isActive = true
    heightAnchor.constraint(equalToConstant: 16).isActive = true
    setImage(UIImage(named: "arrow"), for: .normal)
  }
}

extension Button {
  @objc private func buttonTapped() {
    onButtonAction?()
  }
}
