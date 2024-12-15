//
//  AlertService.swift
//  Rick&Morty
//
//  Created by Леонид Турко on 15.12.2024.
//

import UIKit

final class AlertService {
  
  static let shared = AlertService()
  private init() {}
  
  func showAlert(
    title: String,
    message: String,
    on viewController: UIViewController
  ) {
    let alertController = UIAlertController(
      title: title,
      message: message,
      preferredStyle: .alert
    )
    let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
    alertController.addAction(okAction)
    
    DispatchQueue.main.async {
      viewController.present(alertController, animated: true, completion: nil)
    }
  }
}
