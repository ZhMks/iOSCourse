//
//  PhotosCollectionVIewCell.swift
//  Navigation
//
//  Created by Максим Жуин on 21.09.2023.
//

import StorageService
import UIKit

class PhotosCollectionViewCell : UICollectionViewCell {

    static let id = "PhotosCollectionViewCell"
    
    lazy var photoImageView : UIImageView = {
        let photoImageView = UIImageView()
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        photoImageView.layer.cornerRadius = 6
        photoImageView.layer.masksToBounds = true
        return photoImageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(photoImageView)
        contentView.clipsToBounds = true
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func update(photo: UIImage) {
        photoImageView.image = photo
    }

    func updateForTableView(photo: Photos) {
        photoImageView.image = photo.photoView
    }

    func setupUI(){
        NSLayoutConstraint.activate([
            photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            photoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
