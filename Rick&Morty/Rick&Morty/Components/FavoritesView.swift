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
    tableView.backgroundColor = .systemPink
    tableView.delegate = self
    tableView.dataSource = self
    tableView.backgroundColor = .systemBackground
    tableView.separatorStyle = .none
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
    2
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueCell(indexPath) as FavoriteCell
    
    return cell
  }
}

// MARK: - UITableViewDelegate
extension FavoritesView: UITableViewDelegate {
  
}

extension FavoritesView {
  private func setupViews() {
    addSubview(tableView)
  }
  
  private func setupConstraints() {
    tableView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
  }
}
