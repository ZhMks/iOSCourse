//
//  ProfileViewModel.swift
//  Navigation
//
//  Created by Максим Жуин on 20.11.2023.
//

import UIKit
import StorageService


protocol ProfileViewModel {
    var onDetail: Action? {get set}
    var dataSource: [Post]? {get set}
    var imgArray: [Photos]? {get set}
}


class ProfileVMImp: ProfileViewModel {

    var dataSource: [StorageService.Post]?

    var imgArray: [StorageService.Photos]?

    var onDetail: Action?

    init() {
        fetchData()
    }

    func fetchData() {
        let photos = Photos.makeArray()
        let data = Post.makeArray()
        self.dataSource = data
        self.imgArray = photos
    }
}
