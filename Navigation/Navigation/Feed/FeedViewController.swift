//
//  FeedViewController.swift
//  Navigation
//
//  Created by Максим Жуин on 26.08.2023.
//

import UIKit
import SnapKit

class FeedViewController: UIViewController {
    
    struct Post {
        var title: String?
    }
    
    lazy var uiStackView: UIStackView = {
        let stack = UIStackView()
        let topButton = GoToPostButton()
        let bottomButton = GoToPostButton()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.addArrangedSubview(topButton)
        stack.addArrangedSubview(bottomButton)
        stack.axis = .vertical
        stack.spacing = 10
        stack.distribution = .fillProportionally
        topButton.addTarget(self, action: #selector(onPressed(_:)), for: .touchUpInside)
        bottomButton.addTarget(self, action: #selector(onPressed(_:)), for: .touchUpInside)
        return stack
    }()
    
    
    let hamsterImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "hamster")
        imageView.layer.cornerRadius = 80
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.systemBackground
        view.addSubview(hamsterImage)
        view.addSubview(uiStackView)
        setupConstraintsForStack()
        imageViewPositionChange()
    }

    
    // MARK: - Func
    
    func imageViewPositionChange() {
        hamsterImage.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(80)
            make.leading.equalTo(80)
            make.trailing.equalTo(-80)
            make.height.equalTo(200)
        }
    }
    
    func setupConstraintsForStack() {
        let safeAreaLayoutGuide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            uiStackView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            uiStackView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor)
        ])
        
    }
    
    @objc func onPressed(_ sender: UIButton) {
        if sender.isTouchInside {
            let postViewController = PostViewController()
            let post1 = Post(title: "Заголовок поста")
            postViewController.title = post1.title
            navigationController?.pushViewController(postViewController, animated: true)
        }
    }
}
