//
//  TabbarViewController.swift
//  Rick&Morty
//
//  Created by Леонид Турко on 07.12.2024.
//

import UIKit

final class TabbarViewController: UITabBarController {
  private var charactersViewController: CharactersViewController = {
    let viewController = CharactersViewController()

    
    viewController.tabBarItem = .init(title: "Characters", image: UIImage(systemName: "person"), tag: 0)
    //viewController.tabBarItem.title.backgroundColor = .white
    return viewController
  }()
  
  private var searchViewController: SearchViewController = {
    let viewController = SearchViewController()
    viewController.tabBarItem = .init(title: "Search", image: UIImage(systemName: "person"), tag: 1)
    return viewController
  }()
  
  private var favoriteViewController: FavoritesViewController = {
    let viewController = FavoritesViewController()
    viewController.tabBarItem = .init(title: "Favorites", image: UIImage(systemName: "person"), tag: 2)
    return viewController
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tabBar.backgroundColor = .darkGray
    tabBar.tintColor = .white 
    
    viewControllers = [
      charactersViewController,
      searchViewController,
      favoriteViewController
    ]
  }
  
}
