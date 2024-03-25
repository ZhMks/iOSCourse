//
//  InfoViewModel.swift
//  Navigation
//
//  Created by Максим Жуин on 20.11.2023.
//

import UIKit

protocol InfoViewModel {
    var title: String? {get set}
    var captureData: (([[String: Any]]) -> Void)? {get set}
    var onAction: Action? { get set }
    var planetInfo: PlanetInformation? { get set }
    var citizens: [Citizen] { get set }
    var networkService: NetworkServiceProtocol { get }
    var currentState: ((State) -> Void)? { get set }
    var state: State { get set }
    func updateCitizens(for URL: [URL?]?)
}

class InfoVMImp: InfoViewModel {
    var title: String?
    var captureData: (([[String : Any]]) -> Void)?

    var currentState: ((State) -> Void)?

    var state: State {
        didSet {
            currentState?(state)
        }
    }
    var onAction: Action?
    var networkService: NetworkServiceProtocol
    var planetInfo: PlanetInformation?
    var citizens: [Citizen] = []

    init(networkService: NetworkServiceProtocol, state: State) {
        self.networkService = networkService
        self.state = state
        captureData = { data in
            let title = data.first!["title"] as? String
            self.title = title
        }
    }

    func updateCitizens(for URL: [URL?]?) {
        if let urlArray = URL {
            for eachUrl in urlArray {
                self.networkService.fetchCitizens(with: eachUrl, completion: { result in
                    switch result {
                    case .success(let success):
                        self.citizens.append(success)
                        self.state = .green
                    case .failure(let failure):
                        print(failure.description)
                    }
                })
            }

        }
    }
}
