//
//  UIViewController+Extension.swift
//  Rick&Morty
//
//  Created by Леонид Турко on 04.12.2024.
//

import UIKit

extension UIViewController {
  func setBackgroundImage() {
    let backgroundImageView = UIImageView(frame: view.bounds)
    backgroundImageView.image = UIImage(named: "background")
    backgroundImageView.contentMode = .scaleAspectFill
    view.addSubview(backgroundImageView)
    view.sendSubviewToBack(backgroundImageView)
  }
}
