//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Максим Жуин on 26.08.2023.
//

import UIKit
import StorageService
import iOSIntPackage

class ProfileViewController: UIViewController {

    private lazy var imgArray: [UIImage] = []

    // MARK: - Properties
    private var dataSource = Post(author: "", imgae: "", description: "", likes: 0, views: 0).makeArray()
    private var photosArray = Photos(photoView: .init()).makeArray()
    private var imagePublisher = ImagePublisherFacade()

    private lazy var postTableView: UITableView = {
        let postTableView = UITableView(frame: .zero, style: .grouped)
        postTableView.translatesAutoresizingMaskIntoConstraints = false

        return postTableView
    }()

    let header = ProfileTableHeaderView()

    private lazy var animatedButton : UIButton = {
        let animatedButton = UIButton()
        animatedButton.setBackgroundImage(.init(systemName:"clear"), for: .normal)
        animatedButton.tintColor = UIColor(red: 255, green: 255, blue: 255, alpha: 0)
        animatedButton.frame = CGRect(x: 300, y: 50, width: 44, height: 44)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(animatedButtonTapped(_:)))
        animatedButton.addGestureRecognizer(tapGesture)
        return animatedButton
    }()


    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(postTableView)
        setupConstraints()
        tuneTableView()
        postTableView.reloadData()

        #if DEBUG
        view.backgroundColor = .systemBackground
        #else
        view.backgroundColor = .yellow
        #endif
    }

    func returnHeaderView() -> ProfileTableHeaderView {
        return header
    }
}

// MARK: - Functions

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {

    func tuneTableView() {
        postTableView.rowHeight = UITableView.automaticDimension
        postTableView.estimatedRowHeight = 44
        postTableView.setAndLayout(header: header)
        postTableView.tableFooterView = UIView()
        postTableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.id)
        postTableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: PhotosTableViewCell.id)
        postTableView.dataSource = self
        postTableView.delegate = self
        postTableView.sectionFooterHeight = 2
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:)))
        header.profileImage.addGestureRecognizer(tapGesture)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           if section == 0 {
               return 1
           } else {
               return dataSource.count
           }
       }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PhotosTableViewCell.id, for: indexPath) as? PhotosTableViewCell else { return UITableViewCell() }
            cell.configure(with: photosArray)
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.id, for: indexPath) as? PostTableViewCell else { return UITableViewCell() }
            let setting = dataSource[indexPath.row]
            cell.configure(
                author: setting.author,
                title: setting.description,
                imageName: setting.imgae,
                likes: setting.likes,
                views: setting.views
            )
            return cell
        }
    }

    func setupConstraints() {
        let safeAreaLayout = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            postTableView.topAnchor.constraint(equalTo: safeAreaLayout.topAnchor),
            postTableView.leadingAnchor.constraint(equalTo: safeAreaLayout.leadingAnchor),
            postTableView.trailingAnchor.constraint(equalTo: safeAreaLayout.trailingAnchor),
            postTableView.bottomAnchor.constraint(equalTo: safeAreaLayout.bottomAnchor)
        ])
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            let photosViewController = PhotosViewController()
            imagePublisher.subscribe(photosViewController)
            
            // Random Images
            // imagePublisher.addImagesWithTimer(time: 0.5, repeat: 15)

            // My asset images
            photosArray.forEach({ image in
                imgArray.append(image.photoView)
            })
            imagePublisher.addImagesWithTimer(time: 0.5, repeat: 15, userImages: imgArray)

            navigationController?.pushViewController(photosViewController, animated: true)
        }
    }

    @objc func animatedButtonTapped(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5, animations: {
            self.header.profileImage.transform = CGAffineTransform.identity
            self.header.profileImage.layer.position = CGPoint(x: 90, y: 90)
            self.header.animatedView.isHidden = true
        })
    }

    @objc func imageTapped(_: UITapGestureRecognizer) {
        self.view.addSubview(self.header.animatedView)
        self.header.animatedView.addSubview(self.animatedButton)
        self.header.animatedView.isHidden = false
        let scale = self.view.bounds.width / header.profileImage.bounds.width

        UIView.animateKeyframes(withDuration: 0.5, delay: 0.0, options: .calculationModeCubicPaced, animations: {
            self.header.animatedView.frame = self.view.frame
            self.header.animatedView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
            self.header.profileImage.center = self.view.center
            self.header.profileImage.transform = CGAffineTransform(scaleX: scale, y: scale)

            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.3, animations: {
                self.animatedButton.tintColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1)
            })

        })
    }

}
