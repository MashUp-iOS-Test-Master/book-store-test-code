//
//  DataManager.swift
//  BookStore
//
//  Created by Eddy on 2022/05/30.
//

import Foundation
import CoreData

final class DataManager {
  static let shared = DataManager()
  var books = [BookEntity]()
  init() {}

  private lazy var persistentContainer: NSPersistentContainer = {
    let container = NSPersistentContainer(name: "Book")
    container.loadPersistentStores { description, error in
      if let error = error {
        fatalError("Unable to load \(error)")
      }
    }
    return container
  }()

  var container: NSPersistentContainer {
    return persistentContainer
  }

  private var mainContext: NSManagedObjectContext {
    return persistentContainer.viewContext
  }

  func saveContext(backgroundContext: NSManagedObjectContext? = nil) {
    let context = backgroundContext ?? mainContext
    guard context.hasChanges else { return }
    do {
      try context.save()
    } catch let error as NSError {
      print("Error: \(error), \(error.userInfo)")
    }
  }

  func fetchJokes() {
    let request = BookEntity.fetchRequest()

    do {
      self.books = try mainContext.fetch(request)
    } catch {
      print(error)
    }
  }

  func register(_ bookDTO: BookDTO) {
    let entity = NSEntityDescription.entity(forEntityName: "BookEntity", in: mainContext)
    if let entity = entity {
      let joke = NSManagedObject(entity: entity, insertInto: mainContext)
      joke.setValue(bookDTO.id, forKey: "id")
      joke.setValue(bookDTO.body, forKey: "body")
      joke.setValue(bookDTO.category.rawValue, forKey: "category")

      self.saveContext()
    }
  }

  func delete(joke: BookEntity) {
    self.mainContext.delete(joke)
    self.saveContext()
  }
}
