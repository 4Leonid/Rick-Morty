//
//  FavoritesViewController.swift
//  Rick&Morty
//
//  Created by Леонид Турко on 03.12.2024.
//

import UIKit

final class FavoritesViewController: UIViewController {
  
  private let favoritesView = FavoritesView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupViews()
    setupConstraints()
    setBackgroundImage()
  }
}


// MARK: - Layouts
private extension FavoritesViewController {
  func setupViews() {
    view.backgroundColor = .systemBackground
    view.addSubview(favoritesView)
  }
  
  func setupConstraints() {
    
    favoritesView.snp.makeConstraints { make in
      make.left.right.equalTo(view).inset(21)
      make.top.equalTo(view.safeAreaLayoutGuide).offset(69)
      make.bottom.equalTo(view.safeAreaLayoutGuide).inset(99)
    }
  }
}
  


