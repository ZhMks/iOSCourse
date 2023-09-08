//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Максим Жуин on 26.08.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    private lazy var profileHeaderView: ProfileHeaderView = {
        let profileHeaderView = ProfileHeaderView()
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
        swipeGesture.direction = .right
        profileHeaderView.addGestureRecognizer(swipeGesture)
        return profileHeaderView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Profile"
        view.backgroundColor = .systemBackground
        view.addSubview(profileHeaderView)
        setupConstraintsForProfileHeader()
    }

    private func setupConstraintsForProfileHeader() {
        let safeAreaLayout = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            profileHeaderView.topAnchor.constraint(equalTo: safeAreaLayout.topAnchor),
            profileHeaderView.leadingAnchor.constraint(equalTo: safeAreaLayout.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: safeAreaLayout.trailingAnchor),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220)
        ])
    }
    
    @objc func handleSwipe(_ gesture: UISwipeGestureRecognizer) {
        if gesture.direction == .right {
            navigationController?.popViewController(animated: true)
        }
    }
}
