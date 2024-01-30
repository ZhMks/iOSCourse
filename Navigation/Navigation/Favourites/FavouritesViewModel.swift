//
//  FavouritesViewModel.swift
//  Navigation
//
//  Created by Максим Жуин on 26.01.2024.
//

import Foundation
import Firebase


protocol FavouritesViewModel {
    var favouritePosts: [FavouritePosts]? { get set }
    var state: State { get set }
    var currentState: ((State) -> Void)? { get set }
    var favouriteService: FavouritesModelService { get }
    func checkAuthorisation()
    func fetchData()
}


final class FavouritesModel: FavouritesViewModel {

    var favouriteService: FavouritesModelService

    var currentState: ((State) -> Void)?

    var favouritePosts: [FavouritePosts]?

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
        print(value)
        if value == "success" {
            favouriteService.fetchPosts()
            favouritePosts = favouriteService.favouritePosts
            state = .green
        } else {
            favouritePosts = favouriteService.favouritePosts
            state = .red
        }
    }

    func fetchData() {
        favouriteService.fetchPosts()
        self.favouritePosts = favouriteService.favouritePosts
    }

}
