//
//  SceneDelegate.swift
//  Navigation
//
//  Created by Максим Жуин on 26.08.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }

        let window = UIWindow(windowScene: scene)

        lazy var bookSymbol: UIImage = {
            let configuration = UIImage.SymbolConfiguration(font: UIFont.systemFont(ofSize: 12), scale: .large)
            let image = UIImage(systemName: "house.fill", withConfiguration: configuration)
            if let image {
                bookSymbol = image
            }
            return bookSymbol
        }()

        lazy var sunSymbol: UIImage = {
            let configuration = UIImage.SymbolConfiguration(font: UIFont.systemFont(ofSize: 12), scale: .large)
            let image = UIImage(systemName: "person.fill", withConfiguration: configuration)
            if let image {
                sunSymbol = image
            }
            return sunSymbol
        }()

        let tabController = UITabBarController()

        let feedViewController = FeedViewController()
        let logInViewController = LogInViewController()

        let feedNavigationController = UINavigationController(rootViewController: feedViewController)
        let profileNavigationController = UINavigationController(rootViewController: logInViewController)

        feedNavigationController.tabBarItem = UITabBarItem(title: "Feed", image: bookSymbol, tag: 0)
        profileNavigationController.tabBarItem = UITabBarItem(title: "Profile", image: sunSymbol, tag: 1)

        let controllers = [feedNavigationController, profileNavigationController]

        tabController.viewControllers = controllers
        window.rootViewController = tabController
        window.makeKeyAndVisible()
        self.window = window
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
}
