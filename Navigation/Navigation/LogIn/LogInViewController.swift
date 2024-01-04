//
//  LogInViewController.swift
//  Navigation
//
//  Created by Максим Жуин on 08.09.2023.
//

import UIKit

class LogInViewController: UIViewController {

    // MARK: - Properties

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

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.isHidden = true
        loginButton.addTarget(self, action: #selector(logInButtonPressed(_:)), for: .touchUpInside)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addSubviews()
        setupConstraints()
        setupKeyboardObservers()
        view.layoutIfNeeded()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        removeKeyboardObservers()
    }

    @objc func logInButtonPressed(_ sender: UIButton) {
        let profileView = ProfileViewController()
        navigationController?.pushViewController(profileView, animated: true)
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

   private func setupConstraints() {

       vkLogo.snp.makeConstraints { make in
           make.top.equalTo(contentView.snp.top).offset(120)
           make.centerX.equalTo(contentView.snp.centerX)
           make.height.width.equalTo(100)
       }

       scrollView.snp.makeConstraints { make in
           make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
           make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(16)
           make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-16)
           make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
       }

       contentView.snp.makeConstraints { make in
           make.top.bottom.leading.trailing.width.equalTo(scrollView)
       }

       textFieldView.snp.makeConstraints { make in
           make.top.equalTo(vkLogo.snp.bottom).offset(120)
           make.trailing.equalTo(contentView.snp.trailing)
           make.leading.equalTo(contentView.snp.leading)
           make.height.equalTo(100)
       }

       emailTextField.snp.makeConstraints { make in
           make.height.equalTo(50)
           make.leading.equalTo(textFieldView.snp.leading)
           make.trailing.equalTo(textFieldView.snp.trailing)
           make.top.equalTo(textFieldView.snp.top)
       }

       passwordTextField.snp.makeConstraints { make in
           make.top.equalTo(emailTextField.snp.bottom)
           make.leading.equalTo(textFieldView.snp.leading)
           make.trailing.equalTo(textFieldView.snp.trailing)
           make.height.equalTo(50)
       }

       underlineView.snp.makeConstraints { make in
           make.height.equalTo(0.5)
           make.leading.equalTo(contentView.snp.leading)
           make.trailing.equalTo(contentView.snp.trailing)
           make.top.equalTo(emailTextField.snp.bottom).offset(0.5)
           make.bottom.equalTo(passwordTextField.snp.top).offset(-0.5)
       }

       loginButton.snp.makeConstraints { make in
           make.height.equalTo(50)
           make.top.equalTo(textFieldView.snp.bottom).offset(16)
           make.leading.equalTo(contentView.snp.leading)
           make.trailing.equalTo(contentView.snp.trailing)
           make.bottom.equalTo(contentView.snp.bottom)
       }
    }

    private func addSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(vkLogo)
        contentView.addSubview(loginButton)
        contentView.addSubview(textFieldView)
        textFieldView.addSubview(emailTextField)
        textFieldView.addSubview(passwordTextField)
        contentView.addSubview(underlineView)
    }

}
