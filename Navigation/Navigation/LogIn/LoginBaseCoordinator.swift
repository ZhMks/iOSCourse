//
//  LoginBaseCoordinator.swift
//  Navigation
//
//  Created by Максим Жуин on 20.11.2023.
//

import UIKit
import FirebaseFirestore


class LoginCoordinator: LoginBaseCoordinator {
    
    var parentCoordinator: MainBaseCoordinator?
    var rootViewController: UIViewController = UIViewController()

    func start() -> UIViewController {
        let viewModel = LoginVMImp(authService: Checker.shared)
        viewModel.onDetail = { [weak self] in
            self?.showDetailScreen()
        }
        viewModel.onSignUP = { [weak self] in
            self?.showSignUpScree()
        }
        let module = LogInViewController(viewModel: viewModel)
        rootViewController = UINavigationController(rootViewController: module)
        return rootViewController
    }
    

    func showDetailScreen() {
        let profileVC = ProfileVMImp()
        var user = UserClass(login: "", fullName: "", avatarImg: UIImage(systemName: "checkmark")!, status: "")
        let events = FiresService().fetchEvents { [weak self] result in
            switch result {
            case .success(let success):
                user = UserClass(login: "", fullName: success.name, avatarImg: UIImage(named: "copybara")!, status: success.status)
                let profileViewModel = ProfileTableViewModel(user: user)
                let header = ProfileTableHeaderView(viewModel: profileViewModel)
                let module = ProfileViewController(viewModel: profileVC, header: header)
                self?.navigationRootViewController?.pushViewController(module, animated: true)
            case .failure(let failure):
                let profileViewModel = ProfileTableViewModel(user: user)
                let header = ProfileTableHeaderView(viewModel: profileViewModel)
                let module = ProfileViewController(viewModel: profileVC, header: header)
                self?.navigationRootViewController?.pushViewController(module, animated: true)
            }
        }

        profileVC.onDetail = { [weak self] in
            self?.showPhotoScreen()
        }
    }

    func showPhotoScreen() {
        let photoVM = PhotosVMImp()
        let photoVC = PhotosViewController(viewModel: photoVM)
        self.navigationRootViewController?.pushViewController(photoVC, animated: true)
    }

    func showSignUpScree() {
        let signUpScreen = SignUpController()
        self.navigationRootViewController?.pushViewController(signUpScreen, animated: true)
    }

}
