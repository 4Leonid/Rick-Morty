//
//  FavoritesView.swift
//  Rick&Morty
//
//  Created by Леонид Турко on 03.12.2024.
//

import UIKit

final class FavoritesView: UIView {
  
  private lazy var tableView: UITableView = {
    
    let tableView = UITableView()
    tableView.backgroundColor = .black
    tableView.delegate = self
    tableView.dataSource = self
    tableView.backgroundColor = .systemBackground
    tableView.separatorStyle = .none
    tableView.layer.cornerRadius = 21
    tableView.registerCell(FavoriteCell.self)
    
    return tableView
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setupViews()
    setupConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK: - UITableViewDataSource
extension FavoritesView: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    3
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueCell(indexPath) as FavoriteCell
    
    return cell
  }
}

// MARK: - UITableViewDelegate
extension FavoritesView: UITableViewDelegate {
 
}

private extension FavoritesView {
  
  func setupViews() {
    backgroundColor = .black
    layer.cornerRadius = 42
    addSubview(tableView)
  }
  
  func setupConstraints() {
    tableView.snp.makeConstraints { make in
      make.edges.equalToSuperview().inset(23)
    }
  }
}
