//
//  FeedViewController.swift
//  Navigation
//
//  Created by Максим Жуин on 26.08.2023.
//

import UIKit

class FeedViewController: UIViewController {

    private var feedModel: FeedViewModel

    struct Post {
        var title: String?
    }

    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.textColor = .black
        textField.backgroundColor = .systemGray3
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor(named: "black")?.cgColor
        textField.keyboardType = .default
        textField.returnKeyType = .done
        textField.placeholder = NSLocalizedString("Please enter text", tableName: "Localizable", comment: "")
        return textField
    }()

    private lazy var topButton: UIButton = {
        let topButton = UIButton(type: .system)
        topButton.translatesAutoresizingMaskIntoConstraints = false
        topButton.backgroundColor = .blue
        topButton.setTitle(NSLocalizedString("Go to Post", tableName: "Localizable", comment: ""), for: .normal)
        topButton.setTitleColor(.white, for: .normal)
        topButton.addTarget(self, action: #selector(tapOnTopButton(_:)), for: .touchUpInside)
        return topButton
    }()

    private lazy var checkGuessButton: UIButton = {
        let checkGuessButton = UIButton(type: .system)
        checkGuessButton.translatesAutoresizingMaskIntoConstraints = false
        checkGuessButton.setTitle(NSLocalizedString("Check Pass", tableName: "Localizable", comment: ""), for: .normal)
        checkGuessButton.setTitleColor(.white, for: .normal)
        checkGuessButton.backgroundColor = .blue
        checkGuessButton.addTarget(self, action: #selector(tapOnCheckGuessButton(_:)), for: .touchUpInside)
        return checkGuessButton
    }()

    private lazy var hamsterImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "hamster")
        imageView.layer.cornerRadius = 80
        imageView.layer.masksToBounds = true
        return imageView
    }()

    private lazy var goToInfoScreen: UIButton = {
        let goToInfoScreen = UIButton(type: .system)
        goToInfoScreen.translatesAutoresizingMaskIntoConstraints = false
        goToInfoScreen.setTitle(NSLocalizedString("Go to Info", tableName: "Localizable", comment: ""), for: .normal)
        goToInfoScreen.addTarget(self, action: #selector(tapOnGoToInfoButton(_:)), for: .touchUpInside)
        return goToInfoScreen
    }()

    // MARK: - Lifecycle

    init(viewModel: FeedViewModel) {
        self.feedModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.systemBackground
        setupImageView()
        bindModel()
    }


    // MARK: - Func

    func setupImageView() {
        let safeAreaLayoutGuide = view.safeAreaLayoutGuide
        view.addSubview(hamsterImage)
        view.addSubview(textField)
        view.addSubview(topButton)
        view.addSubview(checkGuessButton)
        view.addSubview(goToInfoScreen)
        NSLayoutConstraint.activate([
            hamsterImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 80),
            hamsterImage.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 80),
            hamsterImage.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -80),
            hamsterImage.heightAnchor.constraint(equalToConstant: 150),

            textField.topAnchor.constraint(equalTo: hamsterImage.bottomAnchor, constant: 30),
            textField.heightAnchor.constraint(equalToConstant: 60),
            textField.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),

            topButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20),
            topButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),

            checkGuessButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            checkGuessButton.topAnchor.constraint(equalTo: topButton.bottomAnchor, constant: 20),

            goToInfoScreen.topAnchor.constraint(equalTo: checkGuessButton.bottomAnchor, constant: 25),
            goToInfoScreen.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 80),
            goToInfoScreen.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -80),
            goToInfoScreen.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -40)
        ])
    }

    private func bindModel() {
        feedModel.currentState = { [weak self] state in
            guard let self else { return }
            switch state {
            case .green: topButton.backgroundColor = .green
            case .red: topButton.backgroundColor = .red
            default: return
            }
        }
    }

    @objc func tapOnTopButton(_ sender: UIButton) {
        switch feedModel.state {
        case .green: 
            feedModel.onDetail?()
        case .red:
            let uiAlert = UIAlertController(title: NSLocalizedString("Error", tableName: "Localizable", comment: ""),
                                            message: NSLocalizedString("Enter Correct Password", tableName: "Localizable", comment: ""),
                                            preferredStyle: .alert)
            let alertAction = UIAlertAction(title: NSLocalizedString("Back",
                                                                     tableName: "Localizable",
                                                                     comment: ""),
                                            style: .cancel)
            uiAlert.addAction(alertAction)
            self.navigationController?.present(uiAlert, animated: true)
        default: return
        }
    }

    @objc func tapOnCheckGuessButton(_ sender: UIButton) {
        self.textField.resignFirstResponder()
        if let text = self.textField.text {
            feedModel.check(word: text)
        }
    }

    @objc func tapOnGoToInfoButton(_ sender: UIButton) {
        feedModel.onInfoScreen?()
    }
}
