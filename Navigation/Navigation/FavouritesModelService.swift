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

    private(set) var favouritePosts = [FavouritePosts]()
    private let coreDataService = CoreDataService.shared
    private let request = FavouritePosts.fetchRequest()

   func fetchPosts() {
        do {
            favouritePosts = try coreDataService.context.fetch(request)
        } catch {
            print(error.localizedDescription)
            favouritePosts = []
        }
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
                print(newFavouritePost)
                coreDataService.saveContext()
                fetchPosts()
            } catch {
                print(error.localizedDescription)
            }
        }
    }

    func deletePostAt(index: Int) {
        coreDataService.context.delete(favouritePosts[index])
        coreDataService.saveContext()
        fetchPosts()
    }

    func searchData(with author: String) -> [FavouritePosts] {
        let secondReques = FavouritePosts.fetchRequest()
        let predicate = NSPredicate.init(format: "authorName = %@", author)
        secondReques.predicate = predicate
        do {
            let arrData = try coreDataService.context.fetch(secondReques)
            if arrData.count > 0 {
               return arrData
            }
        } catch {
            print(error.localizedDescription)
        }
        return self.favouritePosts
    }
}

