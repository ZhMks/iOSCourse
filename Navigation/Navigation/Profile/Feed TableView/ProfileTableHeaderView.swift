//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Максим Жуин on 02.09.2023.
//

import UIKit
import SnapKit

class ProfileTableHeaderView: UIView {

    // MARK: - Properties

    private var statusText: String?

    override var intrinsicContentSize: CGSize {
        CGSize(width: UIView.noIntrinsicMetric, height: 220)
    }

    lazy var animatedView: UIView = {
        let animatedView = UIView()
        animatedView.isHidden = true
        return animatedView
    }()

    private lazy var nameLabel: UILabel = {
        let name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.text = "Hipster copybara"
        name.font = UIFont.boldSystemFont(ofSize: 16)
        name.textColor = .black

        return name
    }()

    lazy var profileImage: UIImageView = {
        let profileImage = UIImage(named: "copybara")
        let profileView = UIImageView()
        profileView.image = profileImage
        profileView.translatesAutoresizingMaskIntoConstraints = false
        profileView.layer.borderColor = UIColor(white: 100, alpha: 1).cgColor
        profileView.layer.borderWidth = 3
        profileView.layer.cornerRadius = 75
        profileView.layer.masksToBounds = true
        profileView.isUserInteractionEnabled = true

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
        setStatusButton.backgroundColor = UIColor(red: 0/255, green: 132/255, blue: 247/255, alpha: 1)
        setStatusButton.setTitle("Set status", for: .normal)
        setStatusButton.titleLabel?.textColor = .white
        setStatusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        setStatusButton.layer.shadowRadius = 4
        setStatusButton.layer.shadowColor = UIColor(named: "black")?.cgColor
        setStatusButton.layer.shadowOpacity = 0.7
        setStatusButton.layer.cornerRadius = 10

        return setStatusButton
    }()

    // MARK: - Lyfecicle

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .secondarySystemBackground
        addSubViews()
        setUpConstraints()
        statusTextField.addTarget(self, action: #selector(statusTextChanged(_:)), for: .editingChanged)
        setStatusButton.addTarget(self, action: #selector(statusButtonPressed(_:)), for: .touchUpInside)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Functions

extension ProfileTableHeaderView {
    @objc func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text
    }

    @objc func statusButtonPressed(_ sender: UIButton) {
        UIView.animate(withDuration: 0.4) { [self] in
            self.setStatusButton.transform = CGAffineTransform(scaleX: 1.25, y: 1.25)
            self.setStatusButton.backgroundColor = UIColor(red: 70/255, green: 130/255, blue: 180/255, alpha: 1)
            self.setStatusButton.transform = CGAffineTransform(scaleX: 1, y: 1)
            setStatusButton.backgroundColor = UIColor(red: 0/255, green: 132/255, blue: 247/255, alpha: 1)

            if let text = statusText {
                statusLabelText.text = text
            } else {
                print("There is no text")
            }
        }
    }

    func setUpConstraints() {
        profileImage.snp.makeConstraints { make in
            make.top.leading.equalTo(safeAreaLayoutGuide).offset(16)
            make.bottom.equalTo(setStatusButton.snp.top).offset(-16)
            make.height.width.equalTo(150)
        }
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(27)
            make.leading.equalTo(profileImage.snp.trailing).offset(16)
        }
        statusLabelText.snp.makeConstraints { make in
            make.leading.equalTo(profileImage.snp.trailing).offset(16)
            make.top.equalTo(nameLabel.snp.bottom).offset(20)
        }
        statusTextField.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.width.equalTo(200)
            make.top.equalTo(statusLabelText.snp.bottom).offset(26)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).offset(-16)
        }
        setStatusButton.snp.makeConstraints { make in
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(16)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).offset(-16)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-12)
        }
    }

    func addSubViews() {
        addSubview(nameLabel)
        addSubview(statusLabelText)
        addSubview(statusTextField)
        addSubview(setStatusButton)
        addSubview(profileImage)
    }

}

