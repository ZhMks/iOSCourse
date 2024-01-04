//
//  MainCoordinator.swift
//  Navigation
//
//  Created by Максим Жуин on 20.11.2023.
//

import UIKit


class MainCoordinator: MainBaseCoordinator {

    var parentCoordinator: MainBaseCoordinator?
    lazy  var feedCoordinator: FeedBaseCoordinator = FeedCoordinator()
    lazy  var loginCoordinator: LoginBaseCoordinator = LoginCoordinator()
    var rootViewController: UIViewController = UITabBarController()

    func start() -> UIViewController {
        let feedViewController = feedCoordinator.start()
        feedCoordinator.parentCoordinator = self
        feedViewController.tabBarItem = UITabBarItem(title: "Feed", image: UIImage(systemName: "house.fill"), tag: 0)

        let loginViewController = loginCoordinator.start()
        loginCoordinator.parentCoordinator = self
        loginViewController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.fill"), tag: 1)

        (rootViewController as? UITabBarController)?.viewControllers = [feedViewController, loginViewController]
        return rootViewController
    }

}
