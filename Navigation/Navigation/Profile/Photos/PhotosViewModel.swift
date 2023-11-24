//
//  PhotosViewModel.swift
//  Navigation
//
//  Created by Максим Жуин on 20.11.2023.
//

import UIKit
import iOSIntPackage
import StorageService

enum PhotosViewModelState {
    case loadingImages
    case imagesLoaded
}

protocol PhotosViewModel {

    var currentState: ((PhotosViewModelState) -> Void)? {get set}

    var state: PhotosViewModelState {get set}

    var imageSubscriber: ImagePublisherFacade? {get set}

    var imgArray: [UIImage] {get set}

    var photoArray: [Photos] {get set}


    func updateArray()
}


class PhotosVMImp: PhotosViewModel {

    var i = 0

    var currentState: ((PhotosViewModelState) -> Void)?

    var state: PhotosViewModelState {
        didSet {
            currentState?(state)
        }
    }

    var imageSubscriber: iOSIntPackage.ImagePublisherFacade? = ImagePublisherFacade()

    var imgArray: [UIImage] = []
    
    var photoArray: [StorageService.Photos] = Photos(photoView: .init()).makeArray()

    init(state: PhotosViewModelState) {
        self.state = state
        self.imageSubscriber?.subscribe(self)
    }

    func updateArray() {
        
        if i == photoArray.count {
            state = .imagesLoaded
        } else {
            imageSubscriber!.subscribe(self)
            photoArray.forEach({ image in
                imgArray.append(image.photoView)
            })
            imageSubscriber!.addImagesWithTimer(time: 0.5, repeat: imgArray.count, userImages: imgArray)
        }
    }
}


extension PhotosVMImp: ImageLibrarySubscriber {

    func receive(images: [UIImage]) {
            self.imgArray = images
            state = .loadingImages
            i += 1
    }

}
