//
//  PlanetCell.swift
//  Rick&Morty
//
//  Created by Леонид Турко on 10.12.2024.
//

import UIKit

class PlanetCell: UITableViewCell {
  
  let nameLabel: UILabel = {
    let label = UILabel()
    label.text = "Earth"
    label.font = UIFont.boldSystemFont(ofSize: 20)
    label.textColor = .black
    return label
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    setupViews()
    setupConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func update(_ planet: Planet) {
    self.nameLabel.text = planet.name
  }
  
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

