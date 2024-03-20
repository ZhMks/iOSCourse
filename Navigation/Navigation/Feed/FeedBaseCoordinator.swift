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
        viewModel.onInfoScreen = { [weak self] in
            self?.goToInfoScreen()
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
        let networkService = NetworkServiceClass()
        let viewModel = InfoVMImp(networkService: networkService, state: .initial)
        let module = InfoViewController(infoVM: viewModel)
        self.navigationRootViewController?.pushViewController(module, animated: true)
    }

    func goToInfoScreen() {
        let networkService = NetworkServiceClass()
        let viewModel = InfoVMImp(networkService: networkService, state: .initial)
        let module = InfoViewController(infoVM: viewModel)
                viewModel.networkService.fetchData(with: URL.init(string: "https://jsonplaceholder.typicode.com/todos/"), completion: { result in
                    switch result {
                    case .success(let success):
                        viewModel.captureData?(success)
                    case .failure(let failure):
                        print(failure.localizedDescription)
                    }
                })
        viewModel.networkService.fetchInformation(with: URL(string: "https://swapi.dev/api/planets/1"), completion: { (result: Result<PlanetInformation, NetworkServiceErrors>) in
            switch result {
            case .success(let success):
                viewModel.planetInfo = success
                DispatchQueue.main.async { [weak self] in
                    guard let self = self else { return }
                    self.navigationRootViewController?.pushViewController(module, animated: true)
                }
                viewModel.updateCitizens(for: success.citizens)
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        })
    }
}
