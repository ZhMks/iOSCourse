//
//  FavouritesBaseCoordinator.swift
//  Navigation
//
//  Created by Максим Жуин on 26.01.2024.
//

import Foundation
import UIKit
import CoreData

final class FavouritesCoordinator: FavouritesBaseCoordinator {

    var parentCoordinator: MainBaseCoordinator?

    var rootViewController: UIViewController = UIViewController()

    func showDetailScreen() {
        ()
    }

    
    func start() -> UIViewController {
        let favouriteModelService = FavouritesModelService()
        let model = FavouritesModel(favouritePosts: favouriteModelService.favouritePosts,
                                    state: .initial,
                                    favouriteModelService: favouriteModelService)
        let controller = FavouritesViewController(favouriteViewModel: model)
        let navigationController = UINavigationController(rootViewController: controller)
        return navigationController
    }

    
    
}
