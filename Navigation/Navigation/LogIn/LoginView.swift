//
//  LoginView.swift
//  Navigation
//
//  Created by Максим Жуин on 08.09.2023.
//

import UIKit

class LogInView: UIView {
    // MARK: - Properties
    
    private lazy var textFieldView = TextFieldView()
        
    private lazy var vkLogo: UIImageView = {
        let vkLogo = UIImageView(image: .init(named: "vkLogo"))
        vkLogo.translatesAutoresizingMaskIntoConstraints = false
        return vkLogo
    }()
    
    lazy var logInButton: UIButton = {
        let logInButton = UIButton(type: .system)
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        logInButton.setTitle("Log In", for: .normal)
        logInButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        logInButton.setTitleColor(.white, for: .normal)
        logInButton.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
        logInButton.layer.cornerRadius = 10
        logInButton.layer.masksToBounds = true
   
        return logInButton
    }()
    
    // MARK: - LifeCycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        addSubview(vkLogo)
        addSubview(logInButton)
        addSubview(textFieldView)
        setupConstraints()
        setupConstraintsForTextView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Functions

extension LogInView {
    private func setupConstraints() {
        let safeAreaLayout = safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            vkLogo.topAnchor.constraint(equalTo: safeAreaLayout.topAnchor, constant: 120),
            vkLogo.centerXAnchor.constraint(equalTo: safeAreaLayout.centerXAnchor),
            vkLogo.widthAnchor.constraint(equalToConstant: 100),
            vkLogo.heightAnchor.constraint(equalToConstant: 100),
            
            logInButton.topAnchor.constraint(equalTo: textFieldView.bottomAnchor, constant: 16),
            logInButton.leadingAnchor.constraint(equalTo: safeAreaLayout.leadingAnchor, constant: 16),
            logInButton.trailingAnchor.constraint(equalTo: safeAreaLayout.trailingAnchor, constant: -16),
            logInButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setupConstraintsForTextView() {
        let safeAreaLayout = safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            textFieldView.topAnchor.constraint(equalTo: vkLogo.bottomAnchor, constant: 120),
            textFieldView.leadingAnchor.constraint(equalTo: safeAreaLayout.leadingAnchor, constant: 16),
            textFieldView.trailingAnchor.constraint(equalTo: safeAreaLayout.trailingAnchor, constant: -16),
            textFieldView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}
