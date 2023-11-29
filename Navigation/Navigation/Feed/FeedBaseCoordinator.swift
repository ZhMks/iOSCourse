//
//  FeedBaseCoordinator.swift
//  Navigation
//
//  Created by Максим Жуин on 20.11.2023.
//

import UIKit

class FeedCoordinator: FeedBaseCoordinator {

    var rootViewController: UIViewController = UIViewController()

    var parentCoordinator: MainBaseCoordinator?

    func start() -> UIViewController {
        let viewModel = FeedModel(state: .initial)
        viewModel.onDetail = { [weak self] in
            self?.showDetailScreen()
        }
        let module = FeedViewController(viewModel: viewModel)
        rootViewController = UINavigationController(rootViewController: module)
        return rootViewController
    }

    func showDetailScreen() {
        let viewModel = PostVMImp()
        viewModel.showInfoVC = {[weak self] in
            self?.showInfoScreen()
        }
        let module = PostViewController(viewModel: viewModel)
        self.navigationRootViewController?.pushViewController(module, animated: true)
    }

    func showInfoScreen() {
        let viewModel = InfoVMImp()
        let module = InfoViewController(infoVM: viewModel)
        self.navigationRootViewController?.pushViewController(module, animated: true)
    }
}
