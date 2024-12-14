//
//  ImageView.swift
//  Rick&Morty
//
//  Created by Леонид Турко on 03.12.2024.
//

import UIKit


enum ImageType: Int, CaseIterable {
  case card
  case detail
  case search
  case favorite
}

final class ImageView: UIImageView {
  
  init(type: ImageType) {
    super.init(frame: .zero)
    
    switch type {
    case .card:
      layer.cornerRadius = 32
      image = UIImage(named: "default")
      contentMode = .scaleAspectFill
      heightAnchor.constraint(equalToConstant: ScreenSize.height * 0.3).isActive = true
      clipsToBounds = true
      
    case .detail:
      layer.cornerRadius = 41
      backgroundColor = .lightGray
      contentMode = .scaleAspectFit
      layer.borderWidth = 3
      layer.borderColor = UIColor.black.cgColor
      clipsToBounds = true
    case .search:
      image = UIImage(named: "globus")
      clipsToBounds = true
    case .favorite:
      heightAnchor.constraint(equalToConstant: 276).isActive = true
      image = UIImage(named: "default")
      layer.cornerRadius = 21
      clipsToBounds = true
    }
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
