//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Максим Жуин on 02.09.2023.
//

import UIKit

class ProfileHeaderView: UIView {
    // MARK: - Properties
    
    private var statusText: String?
    
    private lazy var nameLabel: UILabel = {
        let name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.text = "Hipster copybara"
        name.font = UIFont.boldSystemFont(ofSize: 16)
        name.textColor = .black
        
        return name
    }()
    
    private lazy var profileImage: UIImageView = {
        let profileImage = UIImage(named: "copybara")
        let profileView = UIImageView()
        profileView.image = profileImage
        profileView.translatesAutoresizingMaskIntoConstraints = false
        profileView.layer.borderColor = UIColor(white: 100, alpha: 1).cgColor
        profileView.layer.borderWidth = 3
        profileView.layer.cornerRadius = 75
        profileView.layer.masksToBounds = true
        
        return profileView
    }()
    
    private lazy var statusLabelText: UILabel = {
        let statusLabelText = UILabel()
        statusLabelText.translatesAutoresizingMaskIntoConstraints = false
        statusLabelText.text = "Waiting for something..."
        statusLabelText.textColor = .gray
        statusLabelText.font = UIFont.systemFont(ofSize: 14)
        
        return statusLabelText
    }()
    
    private lazy var statusTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.textColor = .black
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor(named: "black")?.cgColor
        textField.keyboardType = .default
        textField.returnKeyType = .done
        textField.placeholder = " Input your status"
        
        return textField
    }()
    
    private lazy var setStatusButton: UIButton = {
        let setStatusButton = UIButton()
        setStatusButton.translatesAutoresizingMaskIntoConstraints = false
        setStatusButton.backgroundColor = UIColor.blue
        setStatusButton.setTitle("Set status", for: .normal)
        setStatusButton.titleLabel?.textColor = .white
        setStatusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        setStatusButton.layer.shadowRadius = 4
        setStatusButton.layer.shadowColor = UIColor(named: "black")?.cgColor
        setStatusButton.layer.shadowOpacity = 0.7
        setStatusButton.layer.cornerRadius = 4
        
        return setStatusButton
    }()
    
    private lazy var setTitleButton: UIButton = {
        let setTitleButton = UIButton()
        setTitleButton.translatesAutoresizingMaskIntoConstraints = false
        setTitleButton.backgroundColor = UIColor.black
        setTitleButton.setTitle("Set title", for: .normal)
        setTitleButton.titleLabel?.textColor = .white
        setTitleButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        setTitleButton.layer.shadowRadius = 4
        setTitleButton.layer.shadowColor = UIColor(named: "black")?.cgColor
        setTitleButton.layer.shadowOpacity = 0.7
        setTitleButton.layer.cornerRadius = 4
        
        return setTitleButton
    }()

    
    
    // MARK: - Lyfecicle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .lightGray
        addSubview(profileImage)
        addSubview(nameLabel)
        addSubview(statusLabelText)
        addSubview(statusTextField)
        addSubview(setStatusButton)
        addSubview(setTitleButton)
        setUpConstraints()
        statusTextField.addTarget(self, action: #selector(statusTextChanged(_:)), for: .editingChanged)
        setStatusButton.addTarget(self, action: #selector(statusButtonPressed(_:)), for: .touchUpInside)
        setTitleButton.addTarget(self, action: #selector(setTitleButtonPressed(_:)), for: .touchUpInside)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    
    @objc func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text
    }
    
    @objc func statusButtonPressed(_ sender: UIButton) {
        UIView.animate(withDuration: 0.4) { [self] in
            self.setStatusButton.transform = CGAffineTransform(scaleX: 1.25, y: 1.25)
            self.setStatusButton.backgroundColor = UIColor(red: 70/255, green: 130/255, blue: 180/255, alpha: 1)
            self.setStatusButton.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.setStatusButton.backgroundColor = .blue
            
            if let text = statusText {
                statusLabelText.text = text
            } else {
                print("There is no text")
            }
        }
    }
    
    @objc func setTitleButtonPressed(_ sender: UIButton) {
        UIView.animate(withDuration: 0.4) { [self] in
            self.setTitleButton.transform = CGAffineTransform(scaleX: 1.25, y: 1.25)
            self.setTitleButton.backgroundColor = UIColor(red: 70/255, green: 130/255, blue: 180/255, alpha: 1)
            self.setTitleButton.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.setTitleButton.backgroundColor = .black
        }
    }
    
    func setUpConstraints() {
        let safeAreaLayout = safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            profileImage.topAnchor.constraint(equalTo: safeAreaLayout.topAnchor, constant: 16),
            profileImage.leadingAnchor.constraint(equalTo: safeAreaLayout.leadingAnchor, constant: 16),
            profileImage.heightAnchor.constraint(equalToConstant: 150),
            profileImage.widthAnchor.constraint(equalToConstant: 150),
            
            nameLabel.topAnchor.constraint(equalTo: safeAreaLayout.topAnchor, constant: 27),
            nameLabel.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 16),
            
            statusLabelText.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 16),
            statusLabelText.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 40),
            
            statusTextField.topAnchor.constraint(equalTo: statusLabelText.bottomAnchor, constant: 26),
            statusTextField.trailingAnchor.constraint(equalTo: safeAreaLayout.trailingAnchor, constant: -16),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            statusTextField.widthAnchor.constraint(equalToConstant: 200),
            
            setStatusButton.bottomAnchor.constraint(equalTo: safeAreaLayout.bottomAnchor, constant: 0),
            setStatusButton.leadingAnchor.constraint(equalTo: safeAreaLayout.leadingAnchor, constant: 0),
            setStatusButton.widthAnchor.constraint(equalToConstant: 196),
            
            setTitleButton.bottomAnchor.constraint(equalTo: safeAreaLayout.bottomAnchor),
            setTitleButton.leadingAnchor.constraint(equalTo: setStatusButton.trailingAnchor, constant: 0),
            setTitleButton.trailingAnchor.constraint(equalTo: safeAreaLayout.trailingAnchor, constant: 0)
        ])
    }
}
