//
//  UITableViewCell+reuseId.swift
//  Rick&Morty
//
//  Created by Леонид Турко on 03.12.2024.
//

import UIKit

protocol Reusable {}

extension UITableViewCell: Reusable {}

extension Reusable where Self: UITableViewCell {
  
  static var reuseId: String {
    String(describing: self)
  }
  
}
