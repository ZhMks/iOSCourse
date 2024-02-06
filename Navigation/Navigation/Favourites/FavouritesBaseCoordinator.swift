//
//  FavouritesBaseCoordinator.swift
//  Navigation
//
//  Created by Максим Жуин on 26.01.2024.
//

import Foundation
import UIKit



final class FavouritesCoordinator: FavouritesBaseCoordinator {

    var parentCoordinator: MainBaseCoordinator?

    var rootViewController: UIViewController = UIViewController()

    func showDetailScreen() {
        ()
    }

    func start() -> UIViewController {
        let coreDataService = CoreDataService()
        let service = FavouritesModelService(coreDataService: coreDataService)
        let model = FavouritesModel(service: service, state: .initial)
        let controller = FavouritesViewController(favouriteViewModel: model)
        rootViewController = UINavigationController(rootViewController: controller)
        return rootViewController
    }
    
}
