//
//  FavouritesViewModel.swift
//  Navigation
//
//  Created by Максим Жуин on 26.01.2024.
//

import Foundation


protocol FavouritesViewModel {
    var favouriteModelService: FavouritesModelService { get }
    var favouritePosts: [FavouritePosts] { get set }
    var state: State { get set }
    var currentState: ((State) -> Void)? { get set }
}


final class FavouritesModel: FavouritesViewModel {

    var currentState: ((State) -> Void)?

    var favouriteModelService: FavouritesModelService

    var state: State {
        didSet {
            currentState?(state)
        }
    }

    var favouritePosts: [FavouritePosts]

    init(favouritePosts: [FavouritePosts], state: State, favouriteModelService: FavouritesModelService) {
        self.favouritePosts = favouritePosts
        self.state = state
        self.favouriteModelService = favouriteModelService
    }

    
}
