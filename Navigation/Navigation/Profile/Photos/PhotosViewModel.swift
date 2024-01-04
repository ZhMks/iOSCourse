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

enum PhotosState: Error {
    case faledLoad
}

typealias ImageResult = Result<[UIImage], PhotosState>

protocol PhotosViewModel {

    var imageSubscriber: ImagePublisherFacade? {get set}

    var imgArray: [UIImage]? {get set}

    var photoArray: [Photos] {get set}

    func processImages(completion: @escaping (ImageResult) -> Void)
}


class PhotosVMImp: PhotosViewModel {

    var imageSubscriber: iOSIntPackage.ImagePublisherFacade? = ImagePublisherFacade()

    var imgArray: [UIImage]? = []

    var photoArray: [StorageService.Photos] = Photos(photoView: .init()).makeArray()

    func processImages(completion: @escaping (ImageResult) -> Void) {
        guard self.imgArray != nil  else {
            completion(.failure(.faledLoad))
            return
        }
        self.photoArray.forEach({ [weak self] image in
            self?.imgArray?.append(image.photoView)
        })
        DispatchQueue.global().async {
            let imgProc = ImageProcessor()
            imgProc.processImagesOnThread(sourceImages: self.imgArray!, filter: .tonal, qos: .background) { cgImages in
                self.imgArray = cgImages.map({ UIImage(cgImage: $0!) })
                completion(.success(self.imgArray!))
            }
        }
    }
}



