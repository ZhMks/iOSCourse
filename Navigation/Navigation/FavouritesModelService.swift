//
//  FavouritesModelService.swift
//  Navigation
//
//  Created by Максим Жуин on 26.01.2024.
//

import Foundation
import CoreData
import UIKit


final class FavouritesModelService {
    
    private(set) var favouritePosts = [FavouritePosts]()
    private let coreDataService = CoreDataService.shared


    private func fetchPosts() {

        let request = FavouritePosts.fetchRequest()
        do {
            favouritePosts = try coreDataService.context.fetch(request)
        } catch {
            print(error.localizedDescription)
            favouritePosts = []
        }
    }

    func createModelWith(name: String, text: String, image: UIImage, numberOfLikes: Int, numberOfViews: Int) {
        let newFavouritePost = FavouritePosts(context: coreDataService.context)
        newFavouritePost.authorName = name
        newFavouritePost.postText = text
        newFavouritePost.numberOfLikes = Int64(numberOfLikes)
        newFavouritePost.numberOfViews = Int64(numberOfViews)
        let imageData = image.assetName
        newFavouritePost.image = imageData
        coreDataService.saveContext()
        fetchPosts()
    }

    func deletePostAt(index: Int) {
        coreDataService.context.delete(favouritePosts[index])
        coreDataService.saveContext()
        fetchPosts()
    }
}

private extension UIImage {

    var containingBundle: Bundle? {
        imageAsset?.value(forKey: "containingBundle") as? Bundle
    }

    var assetName: String? {
        imageAsset?.value(forKey: "assetName") as? String
    }

}
