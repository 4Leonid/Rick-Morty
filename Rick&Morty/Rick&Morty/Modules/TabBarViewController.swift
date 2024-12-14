//
//  TabBarViewController.swift
//  Rick&Morty
//
//  Created by Леонид Турко on 10.12.2024.
//

import UIKit

final class TabBarViewController: UITabBarController {
  
  // MARK: - Private Properties
  private let charactersViewController = CharactersViewController()
  private let searchViewController = SearchViewController()
  private let favoriteViewController = FavoritesViewController()
  
  // MARK: - Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setupTabBar()
  }
}

// MARK: - Private
private extension TabBarViewController {
  func setupTabBar() {
    tabBar.backgroundColor = .darkGray
    tabBar.tintColor = .white
    
    viewControllers = [
      createController(controller: charactersViewController, pictureName: "person", title: "Characters"),
      createController(controller: searchViewController, pictureName: "magnifyingglass", title: "Search"),
      createController(controller: favoriteViewController, pictureName: "star", title: "Favorite"),
    ]
  }
  
  func createController(
    controller: UIViewController,
    pictureName: String,
    title: String
  ) -> UIViewController {
    
    controller.tabBarItem = .init(title: title, image: UIImage(systemName: pictureName), tag: 0)
    return controller
  }
}
