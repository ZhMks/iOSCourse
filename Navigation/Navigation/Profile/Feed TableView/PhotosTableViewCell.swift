//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Максим Жуин on 21.09.2023.
//

import StorageService
import UIKit
import SnapKit

class PhotosTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {

    // MARK: - Properties

static let id = "PhotosTableViewCell"

    lazy var photosArray: [Photos] = []

    private lazy var uiCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumInteritemSpacing = 8.0
        let uiCollectionView = UICollectionView(frame: contentView.bounds, collectionViewLayout: flowLayout)
        uiCollectionView.translatesAutoresizingMaskIntoConstraints = false
        return uiCollectionView
    }()

    private lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Photos"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .black
        return label
    }()

    private lazy var imageButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(.init(systemName: "arrow.right"), for: .normal)
        button.tintColor = .black
        return button
    }()

    // MARK: - LifeCycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        uiCollectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.id)
        setupUI()
        uiCollectionView.backgroundColor = .clear
        uiCollectionView.reloadData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: -Funcs

    private func setupUI() {
        contentView.addSubview(uiCollectionView)
        contentView.addSubview(imageButton)
        contentView.addSubview(label)
        uiCollectionView.delegate = self
        uiCollectionView.dataSource = self

        label.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(12)
            make.leading.equalTo(contentView.snp.leading).offset(12)
            make.bottom.equalTo(uiCollectionView.snp.top).offset(-12)
        }
        uiCollectionView.snp.makeConstraints { make in
            make.leading.equalTo(contentView.snp.leading).offset(12)
            make.bottom.equalTo(contentView.snp.bottom).offset(-12)
            make.width.equalTo(contentView.snp.width)
            make.height.equalTo(90)
        }
        imageButton.snp.makeConstraints { make in
            make.centerY.equalTo(label.snp.centerY)
            make.trailing.equalTo(contentView.snp.trailing).offset(-12)
        }
    }
}

extension PhotosTableViewCell {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 80, height: 80)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.id, for: indexPath) as? PhotosCollectionViewCell else { return UICollectionViewCell() }
        let settings = photosArray[indexPath.row]
        cell.update(photo: settings)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }

    func configure (with models: [Photos]) {
        self.photosArray = models
    }
}

