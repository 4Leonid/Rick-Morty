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
  //    case star
  //    case info
}

class ImageView: UIImageView {
  
  init(type: ImageType) {
    super.init(frame: .zero)
    
    switch type {
    case .card:
      heightAnchor.constraint(equalToConstant: 325).isActive = true
      layer.cornerRadius = 32
      image = UIImage(named: "default")
      clipsToBounds = true
    case .detail:
      heightAnchor.constraint(equalToConstant: 325).isActive = true
      layer.cornerRadius = 41
      image = UIImage(named: "detail")
      backgroundColor = .lightGray
      contentMode = .scaleAspectFit
      layer.borderWidth = 3
      layer.borderColor = UIColor.black.cgColor
      clipsToBounds = true
    case .search:
      heightAnchor.constraint(equalToConstant: 50).isActive = true
      widthAnchor.constraint(equalToConstant: 50).isActive = true
      image = UIImage(named: "globus")
      clipsToBounds = true
    case .favorite:
      heightAnchor.constraint(equalToConstant: 300).isActive = true
      widthAnchor.constraint(equalToConstant: 300).isActive = true
      image = UIImage(named: "default")
      layer.cornerRadius = 21 
      clipsToBounds = true
    }
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
