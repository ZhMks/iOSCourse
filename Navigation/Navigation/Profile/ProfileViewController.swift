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

    private lazy var tableView: TableView = {
        let tableView = TableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Profile"
        view.backgroundColor = .systemBackground
        view.addSubview(profileHeaderView)
        view.addSubview(tableView)
        setupConstraintsForProfileHeader()
    }

    private func setupConstraintsForProfileHeader() {
        let safeAreaLayout = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            profileHeaderView.topAnchor.constraint(equalTo: safeAreaLayout.topAnchor),
            profileHeaderView.leadingAnchor.constraint(equalTo: safeAreaLayout.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: safeAreaLayout.trailingAnchor),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220),

            tableView.topAnchor.constraint(equalTo: profileHeaderView.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayout.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayout.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayout.bottomAnchor)
        ])
    }
    
    @objc func handleSwipe(_ gesture: UISwipeGestureRecognizer) {
        if gesture.direction == .right {
            navigationController?.popViewController(animated: true)
        }
    }
}
