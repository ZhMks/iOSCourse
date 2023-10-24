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
    private lazy var photoImageView : UIImageView = {
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

    func update(photo: Photos) {
        photoImageView.image = photo.photoView
    }

    func setupUI(){
        photoImageView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalTo(contentView)
        }
    }
}
