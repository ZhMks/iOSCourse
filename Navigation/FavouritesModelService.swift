//
//  FavouritesModelService.swift
//  Navigation
//
//  Created by Максим Жуин on 26.01.2024.
//

import Foundation
import CoreData
import UIKit
import StorageService


final class FavouritesModelService {

    let coreDataService: CoreDataService
    let request = FavouritePosts.fetchRequest()
    init(coreDataService: CoreDataService) {
        self.coreDataService = coreDataService
    }

    func createModelWith(name: String, text: String, image: String, numberOfLikes: Int, numberOfViews: Int) {
        let predicate = NSPredicate.init(format: "authorName = %@ AND postText = %@", name, text)
        request.predicate = predicate
        coreDataService.context.perform { [weak self] in
            guard let self else { return }
            do {
                let arrData = try coreDataService.context.fetch(request)
                if arrData.count > 0 {
                    return
                }
                let newFavouritePost = FavouritePosts(context: coreDataService.context)
                newFavouritePost.authorName = name
                newFavouritePost.postText = text
                newFavouritePost.numberOfLikes = Int64(numberOfLikes)
                newFavouritePost.numberOfViews = Int64(numberOfViews)
                newFavouritePost.image = image
                coreDataService.saveContext()
            } catch {
                print(error.localizedDescription)
            }
        }
    }

    func delete(post: FavouritePosts) {
        coreDataService.context.perform { [weak self] in
            guard let self else { return }
            coreDataService.context.delete(post)
            coreDataService.saveContext()
        }
    }
}

