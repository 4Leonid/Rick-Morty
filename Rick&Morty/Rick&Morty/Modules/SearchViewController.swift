//
//  SearchViewController.swift
//  Rick&Morty
//
//  Created by Леонид Турко on 02.12.2024.
//

import UIKit

final class SearchViewController: UIViewController {
  
  private var searchView = SearchView()

  override func viewDidLoad() {
      super.viewDidLoad()
      
      setupViews()
      setupConstraints()
    setBackgroundImage()
  }
}

// MARK: - Layout
private extension SearchViewController {
  
  func setupViews() {
    view.backgroundColor = .orange
    view.addSubview(searchView)
  }
  
  func setupConstraints() {
    searchView.snp.makeConstraints { make in
      make.left.right.equalTo(view).inset(21)
      make.top.equalTo(view.safeAreaLayoutGuide).offset(69)
      make.bottom.equalTo(view.safeAreaLayoutGuide).inset(99)
    }
  }
}
