//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Максим Жуин on 21.09.2023.
//

import UIKit
import StorageService

class PhotosViewController: UIViewController {

    var viewModel: PhotosViewModel

    var imgArray: [UIImage]?


    // MARK: - Properties

   let uiCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let uiCollectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        uiCollectionView.translatesAutoresizingMaskIntoConstraints = false
        uiCollectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosTableViewCell.id)
        return uiCollectionView
    }()

    let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.color = .black
        activityIndicator.hidesWhenStopped = true
        return activityIndicator
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
        navigationController?.navigationBar.isHidden = false
        setupUI()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        performAlert()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = true
    }

    func bindModel() {
    }

    func performAlert() {
        let uiAlertController = UIAlertController(title: "Обновить", message: "Для обновления требуется перезапуск", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Обновить", style: .cancel) { _ in
            self.activityIndicator.isHidden = false
            self.activityIndicator.startAnimating()
            self.bindModel()
        }
        uiAlertController.addAction(alertAction)
        self.navigationController?.present(uiAlertController, animated: true)
    }
}

// MARK: - Funcs

extension PhotosViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let images = imgArray {
            return images.count
        } else {
            return 0
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosTableViewCell.id, for: indexPath) as? PhotosCollectionViewCell else { return UICollectionViewCell() }
        let settings = imgArray![indexPath.row]
        cell.update(photo: settings)
        return cell
    }

    func setupUI() {
        uiCollectionView.delegate = self
        uiCollectionView.dataSource = self
        view.addSubview(uiCollectionView)
        view.addSubview(activityIndicator)
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            uiCollectionView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            uiCollectionView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            uiCollectionView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            uiCollectionView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),

            activityIndicator.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor)
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

