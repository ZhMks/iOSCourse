//
//  FeedViewController.swift
//  Navigation
//
//  Created by Максим Жуин on 26.08.2023.
//

import UIKit

class FeedViewController: UIViewController {
    
    private lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("TO Post", for: .normal)
        button.setTitleColor(.black, for: .normal)
        
        return button
    }()
    
    let imageView = UIImageView(image: .init(named: "hamster"))
    
    struct Post {
       var title: String?
   }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.orange
        title = "Feed"
        self.navigationItem.title = "Новости"
        
        view.addSubview(button)
        view.addSubview(imageView)
        
        buttonChange()
        
        imageViewChange()
        
        button.addTarget(self, action: #selector(onPressed(_:)), for: .touchUpInside)
    }
        
        func buttonChange() {
            let safeAreaLayoutGuide = view.safeAreaLayoutGuide
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle("To Post", for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 55)
            button.setTitleColor(.black, for: .normal)
            button.layer.borderColor = UIColor.black.cgColor
            button.layer.borderWidth = 2.2
            
            NSLayoutConstraint.activate([
                button.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 40),
                button.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -40),
                button.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 300),
                button.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -200),
            ])
        }
    
    func imageViewChange() {
        let safeAreaLayoutGuide = view.safeAreaLayoutGuide
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 80),
        imageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 40),
        imageView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -40),
        imageView.heightAnchor.constraint(equalToConstant: 200),
        imageView.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    @objc func onPressed(_ sender: UIButton) {
        if sender.isTouchInside {
            let postViewController = PostViewController()
            postViewController.modalPresentationStyle = .fullScreen
            present(postViewController, animated: true, completion: nil)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
