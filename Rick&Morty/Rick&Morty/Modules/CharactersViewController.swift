//
//  CharactersViewController.swift
//  Rick&Morty
//
//  Created by Леонид Турко on 01.12.2024.
//

import UIKit
import SnapKit



final class CharactersViewController: UIViewController {
  
  private var charactersView = CharactersView()

  override func viewDidLoad() {
      super.viewDidLoad()
      
      setupViews()
      setupConstraints()
    
  }
}

extension CharactersViewController {
  
  func setupViews() {
    view.backgroundColor = .orange
    view.addSubview(charactersView)
  }
  
  func setupConstraints() {
    charactersView.snp.makeConstraints { make in
      make.left.right.equalTo(view).inset(21)
      make.top.equalTo(view.safeAreaLayoutGuide).offset(69)
      make.bottom.equalTo(view.safeAreaLayoutGuide).inset(99)
    }
  }
}
