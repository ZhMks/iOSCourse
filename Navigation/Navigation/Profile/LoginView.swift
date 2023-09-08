//
//  LoginView.swift
//  Navigation
//
//  Created by Максим Жуин on 08.09.2023.
//

import UIKit


class LogInView: UIView {
    
    // MARK: - Properties
        
    private lazy var vkLogo: UIImageView = {
        let vkLogo = UIImageView(image: .init(named: "vkLogo"))
        vkLogo.translatesAutoresizingMaskIntoConstraints = false
        return vkLogo
    }()
    
    private lazy var emailTextField: UITextField = {
        let emailTextField = UITextField()
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.font = UIFont.systemFont(ofSize: 16)
        emailTextField.textColor = .black
        emailTextField.backgroundColor = .systemGray6
        emailTextField.layer.cornerRadius = 10
        emailTextField.layer.borderWidth = 0.5
        emailTextField.layer.borderColor = UIColor(named: "lightGray")?.cgColor
        emailTextField.autocapitalizationType = .none
        emailTextField.placeholder = "E-mail or Phone"
      
        
        return emailTextField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.font = UIFont.systemFont(ofSize: 16)
        passwordTextField.textColor = .black
        passwordTextField.backgroundColor = .systemGray6
        passwordTextField.layer.cornerRadius = 10
        passwordTextField.layer.borderWidth = 0.5
        passwordTextField.layer.borderColor = UIColor(named: "lightGray")?.cgColor
        passwordTextField.autocapitalizationType = .none
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true
        
        return passwordTextField
    }()
    
     lazy var logInButton: UIButton = {
        let logInButton = UIButton(type: .system)
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        logInButton.setTitle("Log In", for: .normal)
        logInButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        logInButton.setTitleColor(.white, for: .normal)
        logInButton.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
        logInButton.layer.cornerRadius = 10
   
        
        return logInButton
    }()
    
    
    // MARK: - LifeCycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        addSubview(vkLogo)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(logInButton)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Functions

extension LogInView {
    
    private func setupConstraints() {
        let safeAreaLayout = self.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            vkLogo.topAnchor.constraint(equalTo: safeAreaLayout.topAnchor, constant: 120),
            vkLogo.centerXAnchor.constraint(equalTo: safeAreaLayout.centerXAnchor),
            vkLogo.widthAnchor.constraint(equalToConstant: 100),
            vkLogo.heightAnchor.constraint(equalToConstant: 100),
            
            emailTextField.topAnchor.constraint(equalTo: vkLogo.bottomAnchor, constant: 120),
            emailTextField.leadingAnchor.constraint(equalTo: safeAreaLayout.leadingAnchor, constant: 16),
            emailTextField.trailingAnchor.constraint(equalTo: safeAreaLayout.trailingAnchor, constant: -16),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 0),
            passwordTextField.leadingAnchor.constraint(equalTo: safeAreaLayout.leadingAnchor, constant: 16),
            passwordTextField.trailingAnchor.constraint(equalTo: safeAreaLayout.trailingAnchor, constant: -16),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            logInButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16),
            logInButton.leadingAnchor.constraint(equalTo: safeAreaLayout.leadingAnchor, constant: 16),
            logInButton.trailingAnchor.constraint(equalTo: safeAreaLayout.trailingAnchor, constant: -16),
            logInButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
}
