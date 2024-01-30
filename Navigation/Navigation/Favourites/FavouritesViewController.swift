//
//  FavouritesViewController.swift
//  Navigation
//
//  Created by Максим Жуин on 26.01.2024.
//

import UIKit

class FavouritesViewController: UIViewController {

    private var favouriteViewModel: FavouritesViewModel

    private lazy var favouriteTableView: UITableView = {
        let favouritePostsTableView = UITableView()
        favouritePostsTableView.translatesAutoresizingMaskIntoConstraints = false
        favouritePostsTableView.delegate = self
        favouritePostsTableView.dataSource = self
        return favouritePostsTableView
    }()

    init(favouriteViewModel: FavouritesViewModel) {
        self.favouriteViewModel = favouriteViewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        favouriteViewModel.checkAuthorisation()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        layout()
        bindModel()
    }

    func bindModel() {
        favouriteViewModel.currentState = { [weak self] state in
            guard let self else { return }
            switch state {
            case .green:
                favouriteTableView.isHidden = false
                favouriteTableView.reloadData()
            case .red:
                favouriteTableView.isHidden = true
            case .initial:
                favouriteTableView.isHidden = true
            }
        }
    }

    func layout() {
        view.addSubview(favouriteTableView)
        favouriteTableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.id)
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            favouriteTableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            favouriteTableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            favouriteTableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            favouriteTableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        ])
    }
}

extension FavouritesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            favouriteViewModel.favouriteService.deletePostAt(index: indexPath.row)
            favouriteViewModel.fetchData()
            tableView.reloadData()
        }
    }
}

extension FavouritesViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if favouriteViewModel.favouritePosts == nil {
            return 0
        } else {
            return favouriteViewModel.favouritePosts!.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.id, for: indexPath) as? PostTableViewCell else { return UITableViewCell() }
        let infoForCell = favouriteViewModel.favouritePosts?[indexPath.row]
        cell.configure(author: infoForCell!.authorName!,
                       title: infoForCell!.postText!,
                       imageName: infoForCell!.image!,
                       likes: Int(infoForCell!.numberOfLikes),
                       views: Int(infoForCell!.numberOfViews))
        return cell
    }
}
