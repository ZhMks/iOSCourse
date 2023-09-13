//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Максим Жуин on 26.08.2023.
//

import UIKit

class ProfileViewController: UIViewController {

    private var dataSource: [Post] = [
        Post(author: "Wedmak.Official",
             imgae: "Film1",
             description: "Simple Text that will be changed when i will start doing some changest ins the data",
             likes: 121,
             views: 121),
        Post(author: "Netology",
             imgae: "Netology1",
             description: "This text is showing how i struggle with coding at the end of the course for fuck sake",
             likes: 120, views: 120),
        Post(author: "SimpleTextAuthor",
             imgae: "Film2",
             description: "This is the third row in UITableView, and it is not only annoying to deal with, but hardly understandeble",
             likes: 222,
             views: 223),
        Post(author: "AUTHOR$",
             imgae: "Film3",
             description: "Rollin rolling got me stargazing dont know why becose im gasbenzing",
             likes: 2222,
             views: 2234
            )
    ]

    private lazy var postTableView : UITableView = {
        let postTableView = UITableView.init(frame: .zero, style: .plain)
        postTableView.translatesAutoresizingMaskIntoConstraints = false

        return postTableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(postTableView)
        setupConstraints()
        tuneTableView() 
        navigationItem.title = "Profile"
    }


}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {

    func tuneTableView() {
        postTableView.rowHeight = UITableView.automaticDimension
        postTableView.estimatedRowHeight = 44
        let header = ProfileTableHeaderView()
        postTableView.setAndLayout(header: header)
        postTableView.tableFooterView = UIView()
        postTableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.id)
        postTableView.dataSource = self
        postTableView.delegate = self

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.id, for: indexPath) as? PostTableViewCell else { return UITableViewCell() }
        let setting = dataSource[indexPath.row]
        cell.configure(
            author: setting.author,
            title: setting.description,
            imageName: setting.imgae,
            likes: setting.likes,
            views: setting.views
        )
        return cell
    }

    func setupConstraints() {
        let safeAreaLayout = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            postTableView.topAnchor.constraint(equalTo: safeAreaLayout.topAnchor),
            postTableView.leadingAnchor.constraint(equalTo: safeAreaLayout.leadingAnchor),
            postTableView.trailingAnchor.constraint(equalTo: safeAreaLayout.trailingAnchor),
            postTableView.bottomAnchor.constraint(equalTo: safeAreaLayout.bottomAnchor)
        ])
    }
}
