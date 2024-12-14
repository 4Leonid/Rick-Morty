//
//  PlanetCell.swift
//  Rick&Morty
//
//  Created by Леонид Турко on 10.12.2024.
//

import UIKit

final class PlanetCell: UITableViewCell {
  
  private lazy var nameLabel = Label(type: .bold)
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupViews()
    setupConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK: - Public
extension PlanetCell {
  func update(_ planet: Planet) {
    self.nameLabel.text = planet.name
  }
}

// MARK: - Layouts
private extension PlanetCell {
  func setupViews() {
    contentView.backgroundColor = .green
    contentView.addSubview(nameLabel)
  }
  
  func setupConstraints() {
    nameLabel.snp.makeConstraints { make in
      make.edges.equalTo(contentView).inset(16)
    }
  }
}
