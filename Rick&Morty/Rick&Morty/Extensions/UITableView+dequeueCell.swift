//
//  UITableView+dequeueCell.swift
//  Rick&Morty
//
//  Created by Леонид Турко on 03.12.2024.
//

import UIKit

extension UITableView {
  
  func registerCell<Cell: UITableViewCell>(_ cellClass: Cell.Type) {
    register(cellClass, forCellReuseIdentifier: cellClass.reuseId)
  }
  
  func dequeueCell<Cell: UITableViewCell>(_ indexPath: IndexPath) -> Cell {
    guard let cell = dequeueReusableCell(withIdentifier: Cell.reuseId, for: indexPath) as? Cell else {
      fatalError("Fatal error for cell at \(indexPath)")
    }
    return cell
  }
}
