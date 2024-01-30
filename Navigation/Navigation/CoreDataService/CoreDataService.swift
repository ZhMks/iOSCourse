//
//  CoreDataService.swift
//  Navigation
//
//  Created by Максим Жуин on 25.01.2024.
//

import Foundation
import CoreData


final class CoreDataService {

    static let shared = CoreDataService()

    private init() { }

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
        let context = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        context.persistentStoreCoordinator = persistentContatiner.persistentStoreCoordinator
        return context
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
