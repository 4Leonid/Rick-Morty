//
//  UIViewController+Extension.swift
//  Rick&Morty
//
//  Created by Леонид Турко on 04.12.2024.
//

import UIKit

extension UIViewController {
  func setBackgroundImage() {
          // Create a UIImageView with the desired image
          let backgroundImageView = UIImageView(frame: view.bounds)
          backgroundImageView.image = UIImage(named: "background")
          backgroundImageView.contentMode = .scaleAspectFill // Adjust the image to fill the screen
          
          // Add the UIImageView to the view hierarchy
          view.addSubview(backgroundImageView)
          view.sendSubviewToBack(backgroundImageView) // Send it to the back
      }
}
