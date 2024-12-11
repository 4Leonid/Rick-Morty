//
//  DetailsViewController.swift
//  Rick&Morty
//
//  Created by Леонид Турко on 02.12.2024.
//

import UIKit

final class DetailsViewController: UIViewController {
  
  private let detailsView = DetailsView()
  private let headLineLabel = Label(type: .headline, text: "Details")
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupViews()
    setupConstraints()
    setBackgroundImage()
  }
}

extension DetailsViewController {
  func update(_ character: Character) {
    
    detailsView.update(character)
    
  }
}

extension DetailsViewController {
  func setupViews() {
    
    view.addSubview(detailsView)
    view.addSubview(headLineLabel)
  }
  
  func setupConstraints() {
    
    headLineLabel.snp.makeConstraints { make in
      make.top.equalTo(view.safeAreaLayoutGuide).inset(16)
      make.centerX.equalTo(view.snp.centerX)
    }
    
    detailsView.snp.makeConstraints { make in
      make.top.equalTo(view).offset(view.bounds.height * 0.15)
      make.left.right.equalTo(view).inset(21)
      make.centerY.equalTo(view.snp.centerY)
    }
  }
}
