//
//  DetailsViewController.swift
//  Rick&Morty
//
//  Created by Леонид Турко on 02.12.2024.
//

import UIKit

final class DetailsViewController: UIViewController {
  
  private let detailsView = DetailsView()
  private let detailTextView = DetailsSecondView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupViews()
    setupConstraints()
  }
}

extension DetailsViewController {
  func setupViews() {
    view.backgroundColor = .orange
    
    view.addSubview(detailsView)
    view.addSubview(detailTextView)
  }
  
  func setupConstraints() {
    detailsView.snp.makeConstraints { make in
      make.left.right.equalTo(view).inset(21)
      make.top.equalTo(view.safeAreaLayoutGuide).offset(69)
      make.bottom.equalTo(view.safeAreaLayoutGuide).inset(99)
    }
    
    detailTextView.snp.makeConstraints { make in
      make.top.equalTo(detailsView.snp.bottom).offset(39)
      make.left.right.equalTo(view).inset(21)
    }
  }
}
