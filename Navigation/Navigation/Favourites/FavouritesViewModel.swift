//
//  FavouritesViewModel.swift
//  Navigation
//
//  Created by Максим Жуин on 26.01.2024.
//

import Foundation
import Firebase
import CoreData


protocol FavouritesViewModel {
    var state: State { get set }
    var currentState: ((State) -> Void)? { get set }
    var favouriteService: FavouritesModelService { get }
    func checkAuthorisation()
}


 class FavouritesModel: FavouritesViewModel {


    var favouriteService: FavouritesModelService

    var currentState: ((State) -> Void)?

    var state: State {
        didSet {
            currentState?(state)
        }
    }

     init(service: FavouritesModelService, state: State) {
        self.favouriteService = service
        self.state = state
    }

    func checkAuthorisation() {
        guard let value = UserDefaults.standard.value(forKey: "User") as? String else { return }
        if value == "success" {
            state = .green
        } else {
            state = .red
        }
    }
}

