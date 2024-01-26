//
//  CoreDataService.swift
//  Navigation
//
//  Created by Максим Жуин on 25.01.2024.
//

import Foundation
import CoreData


protocol ICoreDataService {
    var context: NSManagedObjectContext { get }
    func saveContext()
}

final class CoreDataService: ICoreDataService {

    static let shared: ICoreDataService = CoreDataService()

    private init() {

    }

    private let persistentContatiner = {
        let container = NSPersistentContainer(name: "FavouritePostsModel")
        container.loadPersistentStores { storeDescription, error in
            if let error = error {
                print(error.localizedDescription)
                assertionFailure()
            }
        }
        return container
    }()

    lazy var context: NSManagedObjectContext = {
        return persistentContatiner.viewContext
    }()

    func saveContext() {
        do {
            if context.hasChanges {
                try context.save()
            }
        } catch {
            assertionFailure("Error in saving to coreData")
        }
    }
}
