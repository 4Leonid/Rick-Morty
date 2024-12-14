//
//  PlanetsViewController.swift
//  Rick&Morty
//
//  Created by Леонид Турко on 10.12.2024.
//

import UIKit

final class PlanetsViewController: UIViewController {
  
  var onPlanetSelected: ((Planet)->())?
  
  // MARK: - Private Properties
  private var planets: [Planet] = []
  
  private lazy var tableView: UITableView = {
    let tableView = UITableView()
    tableView.backgroundColor = .green
    tableView.registerCell(PlanetCell.self)
    tableView.dataSource = self
    tableView.delegate = self
    return tableView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupViews()
    setupConstraints()
  }
}

// MARK: - Public
extension PlanetsViewController {
  func update(_ planets: [Planet]) {
    self.planets = planets
  }
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension PlanetsViewController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return planets.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueCell(indexPath) as PlanetCell
    let planet = planets[indexPath.row]
    cell.update(planet)
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let planet = planets[indexPath.row]
    onPlanetSelected?(planet)
    dismiss(animated: true)
  }
}

// MARK: - Layouts
private extension PlanetsViewController {
  func setupViews() {
    view.addSubview(tableView)
  }
  
  func setupConstraints() {
    tableView.snp.makeConstraints { make in
      make.edges.equalTo(view).inset(16)
    }
  }
}
