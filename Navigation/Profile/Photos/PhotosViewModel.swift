//
//  PhotosViewModel.swift
//  Navigation
//
//  Created by Максим Жуин on 20.11.2023.
//

import UIKit
import StorageService

enum PhotosViewModelState {
    case loadingImages
    case imagesLoaded
}

enum PhotosState: Error {
    case faledLoad
}

typealias ImageResult = Result<[UIImage], PhotosState>

protocol PhotosViewModel {

    var imgArray: [UIImage]? {get set}

    var photoArray: [Photos] {get set}

}


class PhotosVMImp: PhotosViewModel {

    var imgArray: [UIImage]? = []

    var photoArray: [StorageService.Photos] = Photos.makeArray()
}



