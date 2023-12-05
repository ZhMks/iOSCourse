//
//  LoginBaseCoordinator.swift
//  Navigation
//
//  Created by Максим Жуин on 20.11.2023.
//

import UIKit

class LoginCoordinator: LoginBaseCoordinator {
    
    var parentCoordinator: MainBaseCoordinator?
    var rootViewController: UIViewController = UIViewController()

    func start() -> UIViewController {
        let viewModel = LoginVMImp(state: .initial)
        viewModel.onDetail = { [weak self] in
            self?.showDetailScreen()
        }
        let module = LogInViewController(viewModel: viewModel)
        rootViewController = UINavigationController(rootViewController: module)
        return rootViewController
    }
    

    func showDetailScreen() {
        let profileVC = ProfileVMImp()
        let profileViewModel = ProfileTableViewModel(user: User(login: "Zhmks",
                                                                fullName: "Maksim Zhuin",
                                                                avatarImg: UIImage(named: "copybara")!,
                                                                status: "Show status done"))
        profileVC.onDetail = { [weak self] in
            self?.showPhotoScreen()
        }
        let header = ProfileTableHeaderView(viewModel: profileViewModel)
        let module = ProfileViewController(viewModel: profileVC, header: header)
        self.navigationRootViewController?.pushViewController(module, animated: true)
    }

    func showPhotoScreen() {
        let photoVM = PhotosVMImp()
        let photoVC = PhotosViewController(viewModel: photoVM)
        self.navigationRootViewController?.pushViewController(photoVC, animated: true)
    }

}
