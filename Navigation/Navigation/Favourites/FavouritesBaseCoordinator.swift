//
//  FavouritesBaseCoordinator.swift
//  Navigation
//
//  Created by Максим Жуин on 26.01.2024.
//

import Foundation
import UIKit
import CoreData
import Firebase

final class FavouritesCoordinator: FavouritesBaseCoordinator {

    var parentCoordinator: MainBaseCoordinator?

    var rootViewController: UIViewController = UIViewController()

    func showDetailScreen() {
        ()
    }

    
    func start() -> UIViewController {
        let service = FavouritesModelService()
        let model = FavouritesModel(service: service, state: .initial)
//        if Auth.auth().currentUser != nil {
//            service.fetchPosts()
//            model.favouritePosts = service.favouritePosts
//            model.state = .green
//        } else {
//            model.favouritePosts = []
//            model.state = .red
//        }
        let controller = FavouritesViewController(favouriteViewModel: model)
        rootViewController = UINavigationController(rootViewController: controller)
        return rootViewController
    }

    
    
}
