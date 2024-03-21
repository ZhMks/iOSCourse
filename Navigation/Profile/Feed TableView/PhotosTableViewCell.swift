//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Максим Жуин on 21.09.2023.
//

import StorageService
import UIKit

class PhotosTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {

    // MARK: - Properties

static let id = "PhotosTableViewCell"

    lazy var photosArray: [Photos] = []

    private lazy var uiCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumInteritemSpacing = 8.0
        let uiCollectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        uiCollectionView.translatesAutoresizingMaskIntoConstraints = false
        uiCollectionView.isScrollEnabled = true
        return uiCollectionView
    }()

    private lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = NSLocalizedString("Photos", comment: "")
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = ColorCreator.textColor
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
        super.init(style: .value1, reuseIdentifier: reuseIdentifier)
        uiCollectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.id)
        setupUI()
        uiCollectionView.backgroundColor = .clear
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

        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 12),
            label.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 12),
            label.bottomAnchor.constraint(equalTo: uiCollectionView.topAnchor, constant: -12),

            uiCollectionView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 12),
            uiCollectionView.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -12),
            uiCollectionView.widthAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.widthAnchor),
            uiCollectionView.heightAnchor.constraint(equalToConstant: 90),

            imageButton.centerYAnchor.constraint(equalTo: label.centerYAnchor),
            imageButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12)
        ])
    }
}

extension PhotosTableViewCell {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photosArray.count
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 80, height: 80)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.id, for: indexPath) as? PhotosCollectionViewCell else { return UICollectionViewCell() }
        let settings = photosArray[indexPath.row]
        cell.updateForTableView(photo: settings)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }

    func configure (with models: [Photos]) {
        self.photosArray = models
    }
}

