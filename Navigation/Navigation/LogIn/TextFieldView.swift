//
//  TextFieldView.swift
//  Navigation
//
//  Created by Максим Жуин on 08.09.2023.
//

import UIKit

class TextFieldView: UIView {
    // MARK: - Properties
    
    private lazy var underlineView: UIView = {
        let underlineView = UIView()
        underlineView.translatesAutoresizingMaskIntoConstraints = false
        underlineView.layer.borderColor = UIColor(named: "lightGray")?.cgColor
        underlineView.layer.borderWidth = 0.5
        
        return underlineView
    }()
        
    private lazy var emailTextField: UITextField = {
        let emailTextField = UITextField()
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.font = UIFont.systemFont(ofSize: 16)
        emailTextField.textColor = .black
        emailTextField.backgroundColor = .systemGray6
        emailTextField.layer.borderColor = UIColor(named: "lightGray")?.cgColor
        emailTextField.autocapitalizationType = .none
        emailTextField.placeholder = "E-mail or Phone"
        emailTextField.keyboardType = .default
        emailTextField.returnKeyType = .done
        emailTextField.autocorrectionType = .no
        emailTextField.clearButtonMode = UITextField.ViewMode.whileEditing
        emailTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center


      
        return emailTextField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.font = UIFont.systemFont(ofSize: 16)
        passwordTextField.textColor = .black
        passwordTextField.backgroundColor = .systemGray6
        passwordTextField.autocapitalizationType = .none
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.keyboardType = .default
        passwordTextField.returnKeyType = .done
        passwordTextField.autocorrectionType = .no
        passwordTextField.clearButtonMode = UITextField.ViewMode.whileEditing
        passwordTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center

        
        return passwordTextField
    }()
    
    // MARK: - LifeCycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(underlineView)
        setupConstraints()
        tuneView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    
    func setupConstraints() {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
        
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 0),
            passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
        
            underlineView.topAnchor.constraint(equalTo: topAnchor, constant: 50),
            underlineView.leadingAnchor.constraint(equalTo: leadingAnchor),
            underlineView.trailingAnchor.constraint(equalTo: trailingAnchor),
            underlineView.widthAnchor.constraint(equalToConstant: 0.5),
            underlineView.heightAnchor.constraint(equalToConstant: 0.5)
        ])
    }
    
    func tuneView() {
        layer.cornerRadius = 10
        layer.borderColor = UIColor(named: "lightGray")?.cgColor
        layer.borderWidth = 0.5
    }
    
}

