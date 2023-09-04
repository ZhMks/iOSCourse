//
//  FeedViewController.swift
//  Navigation
//
//  Created by Максим Жуин on 26.08.2023.
//

import UIKit

class FeedViewController: UIViewController {
    
    struct Post {
        var title: String?
    }
    
    lazy var uiStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        
        return stack
    }()
    
    
    let hamsterImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "hamster")
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.systemBackground
        navigationItem.title = "Feed"
        view.addSubview(hamsterImage)
        
        imageViewPositionChange()
    }

    
    func imageViewPositionChange() {
        let safeAreaLayoutGuide = view.safeAreaLayoutGuide
        
        hamsterImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hamsterImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 80),
            hamsterImage.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 40),
            hamsterImage.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -40),
            hamsterImage.heightAnchor.constraint(equalToConstant: 200),
            hamsterImage.widthAnchor.constraint(equalToConstant: 100),
        ])
    }
    
//    @objc func onPressed(_ sender: UIButton) {
//        if sender.isTouchInside {
//            let postViewController = PostViewController()
//            let post1 = Post(title: "Заголовок поста")
//            postViewController.title = post1.title
//            navigationController?.pushViewController(postViewController, animated: true)
//        }
//    }
}
