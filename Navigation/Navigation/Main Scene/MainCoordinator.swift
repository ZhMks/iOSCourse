//
//  MainCoordinator.swift
//  Navigation
//
//  Created by Максим Жуин on 20.11.2023.
//

import UIKit


class MainCoordinator: MainBaseCoordinator {

    lazy var favouritesCoordinator: FavouritesBaseCoordinator = FavouritesCoordinator()

    var parentCoordinator: MainBaseCoordinator?
    lazy  var feedCoordinator: FeedBaseCoordinator = FeedCoordinator()
    lazy  var loginCoordinator: LoginBaseCoordinator = LoginCoordinator()
    var rootViewController: UIViewController = UITabBarController()

    func start() -> UIViewController {
        let feedViewController = feedCoordinator.start()
        feedCoordinator.parentCoordinator = self
        feedViewController.tabBarItem = UITabBarItem(title: NSLocalizedString("Feed", comment: ""),
                                                     image: UIImage(systemName: "house.fill"), tag: 0)

        let loginViewController = loginCoordinator.start()
        loginCoordinator.parentCoordinator = self
        loginViewController.tabBarItem = UITabBarItem(title: NSLocalizedString("Profile", comment: ""),
                                                      image: UIImage(systemName: "person.fill"), tag: 1)

        let favouritesController = favouritesCoordinator.start()
        favouritesCoordinator.parentCoordinator = self
        favouritesController.tabBarItem = UITabBarItem(title: NSLocalizedString("Favourites", comment: ""),
                                                       image: UIImage(systemName: "star"), tag: 2)

        (rootViewController as? UITabBarController)?.viewControllers = [feedViewController, loginViewController, favouritesController]
        return rootViewController
    }

}
