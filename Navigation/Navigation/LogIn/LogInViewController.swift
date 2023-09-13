//
//  LogInViewController.swift
//  Navigation
//
//  Created by Максим Жуин on 08.09.2023.
//

import UIKit

class LogInViewController: UIViewController {
    
    private lazy var loginView : LogInView = {
        let loginView = LogInView()
        loginView.translatesAutoresizingMaskIntoConstraints = false
        return loginView
    }()

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .systemBackground
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        navigationController?.isNavigationBarHidden = true
        view.addSubview(scrollView)
        scrollView.addSubview(loginView)
        setupConstraints()
        loginView.logInButton.addTarget(self, action: #selector(logInButtonPressed(_:)), for: .touchUpInside)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupKeyboardObservers()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        removeKeyboardObservers()
    }

    @objc func logInButtonPressed(_ sender: UIButton) {
        let profileView = ProfileViewController()
        profileView.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(profileView, animated: true)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            loginView.topAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.topAnchor),
            loginView.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor),
            loginView.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor),
            loginView.bottomAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension LogInViewController: UITextFieldDelegate {

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
    }

   private func setupKeyboardObservers() {
       let notificationCenter = NotificationCenter.default
       notificationCenter.addObserver(self, selector: #selector(willShowKeyboard(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
       notificationCenter.addObserver(self, selector: #selector(willHideKeyboard(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc func willShowKeyboard(_ notificator: NSNotification) {
        let keyboardHeight = (notificator.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height
        scrollView.contentInset.bottom += keyboardHeight ?? 0.0
    }

    @objc func willHideKeyboard(_ notificator: NSNotification) {
        scrollView.contentInset.bottom = 0.0
    }

    private func removeKeyboardObservers(){
        let notificationCenter = NotificationCenter.default
        notificationCenter.removeObserver(self)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
