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
    }

    func updateArray() {
        let imgProc = ImageProcessor()
        photoArray.forEach({ [weak self] image in
            self?.imgArray.append(image.photoView)
        })
        imgProc.processImagesOnThread(sourceImages: imgArray,
                                      filter: .tonal,
                                      qos: .background) { [weak self] cgImages in
            self?.imgArray = cgImages.map({ UIImage(cgImage: $0!) })
            self?.state = .imagesLoaded
        }
        state = .loadingImages
    }
}



