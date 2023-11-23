//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Максим Жуин on 21.09.2023.
//

import UIKit
import StorageService
import iOSIntPackage

class PhotosViewController: UIViewController {

    let viewModel: PhotosViewModel

    lazy var imageSubscriber = ImagePublisherFacade()

    private lazy var imgArray: [UIImage] = []

    private lazy var photoArray: [Photos] = Photos(photoView: .init()).makeArray()

    // MARK: - Properties

    private var uiCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let uiCollectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        uiCollectionView.translatesAutoresizingMaskIntoConstraints = false
        uiCollectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosTableViewCell.id)
        return uiCollectionView
    }()

    // MARK: - LifeCycle

    init(viewModel: PhotosViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationItem.title = "Photo Gallery"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupUI()
        navigationController?.navigationBar.isHidden = false
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = true
        imageSubscriber.removeSubscription(for: self)
    }
}

// MARK: - Funcs

extension PhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        imgArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosTableViewCell.id, for: indexPath) as? PhotosCollectionViewCell else { return UICollectionViewCell() }
        let settings = imgArray[indexPath.row]
        cell.update(photo: settings)
        return cell
    }

    func setupUI() {
        uiCollectionView.delegate = self
        uiCollectionView.dataSource = self
        view.addSubview(uiCollectionView)
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            uiCollectionView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            uiCollectionView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            uiCollectionView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            uiCollectionView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor)
        ])
    }
}

extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 120, height: 120)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        8
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
       8
    }
}

extension PhotosViewController: ImageLibrarySubscriber {

    func receive(images: [UIImage]) {
        self.imgArray = images
        uiCollectionView.reloadData()
    }
    

}
