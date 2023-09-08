//
//  LogInViewController.swift
//  Navigation
//
//  Created by Максим Жуин on 08.09.2023.
//

import UIKit

class LogInViewController: UIViewController {
    
    private lazy var loginView = LogInView()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.navigationController?.isNavigationBarHidden = true
        view.addSubview(loginView)
        loginView.frame = view.frame
        loginView.logInButton.addTarget(self, action: #selector(logInButtonPressed(_:)), for: .touchUpInside)
    }
    
    @objc func logInButtonPressed(_ sender: UIButton ){
        let profileView = ProfileViewController()
        profileView.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(profileView, animated: true)
    }
}
