//
//  LogInViewController.swift
//  Navigation
//
//  Created by Максим Жуин on 08.09.2023.
//

import UIKit

class LogInViewController: UIViewController {

    // MARK: - Properties

    var viewModel: LoginViewModel

    private lazy var vkLogo: UIImageView = {
        let vkLogo = UIImageView()
        vkLogo.translatesAutoresizingMaskIntoConstraints = false
        vkLogo.image = UIImage(named: "vkLogo")
        vkLogo.layer.cornerRadius = 12
        return vkLogo
    }()

    private lazy var emailTextField: UITextField = {
        let emailTextField = UITextField()
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.textColor = .black
        emailTextField.font = UIFont.systemFont(ofSize: 16)
        emailTextField.tintColor = UIColor(named: "accentColor")
        emailTextField.autocapitalizationType = .none
        emailTextField.placeholder = "E-mail or phone"
        emailTextField.delegate = self
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 0))
        emailTextField.leftView = paddingView
        emailTextField.leftViewMode = .always
        emailTextField.keyboardType = UIKeyboardType.default
        emailTextField.clearButtonMode = UITextField.ViewMode.whileEditing

        return emailTextField
    }()

    private lazy var underlineView: UIView = {
        let underlineView = UIView()
        underlineView.translatesAutoresizingMaskIntoConstraints = false
        underlineView.layer.borderColor = UIColor(named: "lightGray")?.cgColor
        underlineView.layer.borderWidth = 0.5
        underlineView.backgroundColor = .systemGray6
        return underlineView
    }()

    private lazy var passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.textColor = .black
        passwordTextField.font = UIFont.systemFont(ofSize: 16)
        passwordTextField.tintColor = UIColor(named: "accentColor")
        passwordTextField.isSecureTextEntry = true
        passwordTextField.placeholder = "Password"
        passwordTextField.delegate = self
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 0))
        passwordTextField.leftView = paddingView
        passwordTextField.leftViewMode = .always
        passwordTextField.keyboardType = UIKeyboardType.default
        passwordTextField.clearButtonMode = UITextField.ViewMode.whileEditing
        passwordTextField.addTarget(self, action: #selector(textChangedIn(_:)), for: .allEditingEvents)

        return passwordTextField
    }()

    private lazy var textFieldView: UIView = {
        let textFieldView = UIView()
        textFieldView.translatesAutoresizingMaskIntoConstraints = false
        textFieldView.backgroundColor = .systemGray6
        textFieldView.layer.masksToBounds = true
        textFieldView.layer.cornerRadius = 10
        textFieldView.layer.borderWidth = 0.5
        textFieldView.layer.borderColor = UIColor(named: "lightGray")?.cgColor
        return textFieldView
    }()

    private lazy var loginButton: UIButton = {
        let loginButton = UIButton(type: .system)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.layer.cornerRadius = 10
        loginButton.setTitle("Log In", for: .normal)
        loginButton.clipsToBounds = true
        return loginButton
    }()

    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false

        return contentView
    }()

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false

        return scrollView
    }()


    // MARK: - LifeCycle

    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addSubviews()
        setupConstraints()
        setupKeyboardObservers()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.isHidden = true
        loginButton.addTarget(self, action: #selector(logInButtonPressed(_:)), for: .touchUpInside)
        bindModel()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        removeKeyboardObservers()
    }

    @objc func logInButtonPressed(_ sender: UIButton) {
        if let text = passwordTextField.text {
            viewModel.check(pass: text)
        }
    }

    private func bindModel() {
        viewModel.currentState = { [weak self] state in
            guard let self else {return}
            switch state {
            case .green:
                viewModel.onDetail?()
            case .red:
                print("red")
            case .initial: break
            }
        }
    }

    private func setupConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            vkLogo.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            vkLogo.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            vkLogo.widthAnchor.constraint(equalToConstant: 100),
            vkLogo.heightAnchor.constraint(equalToConstant: 100),

            scrollView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            scrollView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
            scrollView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),

            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),

            textFieldView.topAnchor.constraint(equalTo: vkLogo.bottomAnchor, constant: 120),
            textFieldView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            textFieldView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            textFieldView.heightAnchor.constraint(equalToConstant: 100),

            emailTextField.leadingAnchor.constraint(equalTo: textFieldView.leadingAnchor),
            emailTextField.topAnchor.constraint(equalTo: textFieldView.topAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: textFieldView.trailingAnchor),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),

            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor),
            passwordTextField.leadingAnchor.constraint(equalTo: textFieldView.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: textFieldView.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),

            underlineView.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 0.5),
            underlineView.bottomAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: -0.5),
            underlineView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            underlineView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            underlineView.heightAnchor.constraint(equalToConstant: 0.5),

            loginButton.topAnchor.constraint(equalTo: textFieldView.bottomAnchor, constant: 16),
            loginButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            loginButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }

    private func addSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(vkLogo)
        contentView.addSubview(loginButton)
        contentView.addSubview(textFieldView)
        textFieldView.addSubview(emailTextField)
        textFieldView.addSubview(passwordTextField)
        textFieldView.addSubview(underlineView)
    }
}

extension LogInViewController: UITextFieldDelegate {

    private func setupKeyboardObservers() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(willShowKeyboard(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(willHideKeyboard(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc func willShowKeyboard(_ notificator: NSNotification) {
        let keyboardHeight = (notificator.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height
        scrollView.contentInset.bottom = keyboardHeight ?? 0.0
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

    @objc func textChangedIn(_ textField: UITextField) {
        if let text = textField.text {
            passwordTextField.text = text
        }
    }

}


