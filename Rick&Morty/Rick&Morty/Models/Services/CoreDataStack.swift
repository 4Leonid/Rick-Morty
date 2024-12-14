//
//  CoreDataStack.swift
//  Rick&Morty
//
//  Created by Леонид Турко on 10.12.2024.
//

import Foundation
import CoreData

class CoreDataStack {
  static let shared = CoreDataStack()
  
  private init() {}
  
  lazy var persistentContainer: NSPersistentContainer = {
    let container = NSPersistentContainer(name: "database")
    container.loadPersistentStores { _, error in
      if let error = error as NSError? {
        fatalError("Unresolved error \(error), \(error.userInfo)")
      }
    }
    return container
  }()
  
  var context: NSManagedObjectContext {
    return persistentContainer.viewContext
  }
}

