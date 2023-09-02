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
        return profileHeaderView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Profile"
        view.backgroundColor = .lightGray
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        profileHeaderView.frame = view.frame
        view.addSubview(profileHeaderView)
        setUpConstraints()
    }
    
    func setUpConstraints() {
        let safeAreaLayout = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            profileHeaderView.profileImage.topAnchor.constraint(equalTo: safeAreaLayout.topAnchor, constant: 16),
            profileHeaderView.profileImage.leadingAnchor.constraint(equalTo: safeAreaLayout.leadingAnchor, constant: 16),
            profileHeaderView.profileImage.heightAnchor.constraint(equalToConstant: 150),
            profileHeaderView.profileImage.widthAnchor.constraint(equalToConstant: 150),
            
            profileHeaderView.nameLabel.topAnchor.constraint(equalTo: safeAreaLayout.topAnchor, constant: 27),
            profileHeaderView.nameLabel.leadingAnchor.constraint(equalTo: profileHeaderView.profileImage.trailingAnchor, constant: 16),
            
            profileHeaderView.statusLabelText.leadingAnchor.constraint(equalTo: profileHeaderView.profileImage.trailingAnchor, constant: 16),
            profileHeaderView.statusLabelText.topAnchor.constraint(equalTo: profileHeaderView.nameLabel.bottomAnchor, constant: 40),
            
            profileHeaderView.statusButton.topAnchor.constraint(equalTo: profileHeaderView.statusChangeButton.bottomAnchor, constant: 16),
            profileHeaderView.statusButton.leadingAnchor.constraint(equalTo: safeAreaLayout.leadingAnchor, constant: 16),
            profileHeaderView.statusButton.trailingAnchor.constraint(equalTo: safeAreaLayout.trailingAnchor, constant: -16),
            
            profileHeaderView.statusTextField.topAnchor.constraint(equalTo: profileHeaderView.statusLabelText.bottomAnchor, constant: 26),
            profileHeaderView.statusTextField.trailingAnchor.constraint(equalTo: safeAreaLayout.trailingAnchor, constant: -16),
            profileHeaderView.statusTextField.heightAnchor.constraint(equalToConstant: 40),
            profileHeaderView.statusTextField.widthAnchor.constraint(equalToConstant: 200),
            
            profileHeaderView.statusChangeButton.leadingAnchor.constraint(equalTo: safeAreaLayout.leadingAnchor, constant: 16),
            profileHeaderView.statusChangeButton.trailingAnchor.constraint(equalTo: safeAreaLayout.trailingAnchor, constant: -16),
            profileHeaderView.statusChangeButton.topAnchor.constraint(equalTo: profileHeaderView.statusLabelText.bottomAnchor, constant: 86),
            
        ])
    }
}
