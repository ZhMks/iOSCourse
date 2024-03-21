//
//  MainBaseCoordinator.swift
//  Navigation
//
//  Created by Максим Жуин on 20.11.2023.
//

import UIKit


typealias Action = (() -> Void)


protocol FlowCoordinator: AnyObject {
    var parentCoordinator: MainBaseCoordinator? {get set}
}

protocol Coordinator: FlowCoordinator {
    var rootViewController: UIViewController {get set}
    func start() -> UIViewController
}

extension Coordinator {
    var navigationRootViewController: UINavigationController? {
        get {
            (rootViewController as? UINavigationController)
        }
    }
}

protocol FeedBaseCoordinator: Coordinator {
    func showDetailScreen()
}

protocol LoginBaseCoordinator: Coordinator {
    func showDetailScreen()
}

protocol FavouritesBaseCoordinator: Coordinator {
    func showDetailScreen()
}

protocol MainBaseCoordinator: Coordinator {
    var feedCoordinator: FeedBaseCoordinator { get }
    var loginCoordinator: LoginBaseCoordinator { get }
    var favouritesCoordinator: FavouritesBaseCoordinator { get }
}
