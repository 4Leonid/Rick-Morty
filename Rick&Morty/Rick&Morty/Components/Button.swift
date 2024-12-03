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

class Button: UIButton {
  
  init(type: ButtonStyle) {
    super.init(frame: .zero)
    
    commonInit(type)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func commonInit(_ type: ButtonStyle) {
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
  
  func makeInfoStyle() {
    self.widthAnchor.constraint(equalToConstant: 63).isActive = true
    self.heightAnchor.constraint(equalToConstant: 63).isActive = true
    self.setImage(UIImage(named: "info"), for: .normal)
    backgroundColor = .white
    layer.cornerRadius = 31.5
    clipsToBounds = true 
  }
  
  func makeFavoriteStyle() {
    self.widthAnchor.constraint(equalToConstant: 61).isActive = true
    self.heightAnchor.constraint(equalToConstant: 54).isActive = true
    self.setImage(UIImage(named: "Star 1"), for: .normal)
  }
  
  func makeFavoriteActiveStyle() {
    self.widthAnchor.constraint(equalToConstant: 61).isActive = true
    self.heightAnchor.constraint(equalToConstant: 54).isActive = true
    self.setImage(UIImage(named: "Star 2"), for: .normal)
  }
  
  func makeLeftWhiteStyle() {
    self.widthAnchor.constraint(equalToConstant: 35).isActive = true
    self.heightAnchor.constraint(equalToConstant: 62).isActive = true
    self.setImage(UIImage(named: "leftWhite"), for: .normal)
  }
  
  func makeRightWhiteStyle() {
    self.widthAnchor.constraint(equalToConstant: 35).isActive = true
    self.heightAnchor.constraint(equalToConstant: 62).isActive = true
    self.setImage(UIImage(named: "rightWhite"), for: .normal)
  }
  
  func makeLeftGreenStyle() {
    self.widthAnchor.constraint(equalToConstant: 35).isActive = true
    self.heightAnchor.constraint(equalToConstant: 62).isActive = true
    self.setImage(UIImage(named: "leftGreen"), for: .normal)
  }
  
  func makeRightGreenStyle() {
    self.widthAnchor.constraint(equalToConstant: 35).isActive = true
    self.heightAnchor.constraint(equalToConstant: 62).isActive = true
    self.setImage(UIImage(named: "rightGreen"), for: .normal)
  }
  
  func makeSearchStyle() {
      self.widthAnchor.constraint(equalToConstant: 30).isActive = true
    self.heightAnchor.constraint(equalToConstant: 16).isActive = true
    self.setImage(UIImage(named: "arrow"), for: .normal)
  }
}
