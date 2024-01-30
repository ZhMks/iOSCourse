//
//  FavouritesViewController.swift
//  Navigation
//
//  Created by Максим Жуин on 26.01.2024.
//

import UIKit

class FavouritesViewController: UIViewController {

    private var favouriteViewModel: FavouritesViewModel

    private lazy var searchTextField: UITextField = {
        let searchText = UITextField(frame: CGRect(x: 180, y: 100, width: 200, height: 30))
        searchText.borderStyle = .roundedRect
        searchText.font = UIFont.systemFont(ofSize: 16)
        searchText.placeholder = "Search"
        searchText.backgroundColor = UIColor.white
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: searchText.frame.height))
        searchText.leftView = paddingView
        searchText.leftViewMode = .always
        searchText.delegate = self
        return searchText
    }()

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
                navigationController?.navigationBar.isHidden = false
                favouriteTableView.reloadData()
            case .red:
                favouriteTableView.isHidden = true
                navigationController!.navigationBar.isHidden = true
            case .initial:
                favouriteTableView.isHidden = true
                navigationController!.navigationBar.isHidden = true
            }
        }
    }

    func layout() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tapGesture)
        view.addSubview(favouriteTableView)
        favouriteTableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.id)
        let rightNavButton1 = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: #selector(serchBarButtonTapped))
        let rightNavButton2 = UIBarButtonItem(image: UIImage(systemName: "eraser"), style: .plain, target: self, action: #selector(eraseBarButtonTapped))
        navigationItem.rightBarButtonItems = [rightNavButton1, rightNavButton2]
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            favouriteTableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            favouriteTableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            favouriteTableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            favouriteTableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        ])
    }

    @objc func serchBarButtonTapped() {
        if searchTextField.superview == nil {
               view.addSubview(searchTextField)
           } else {
               searchTextField.text = ""
               searchTextField.removeFromSuperview()
           }
    }

    @objc func eraseBarButtonTapped() {
        searchTextField.text = ""
        searchTextField.becomeFirstResponder()
        favouriteViewModel.fetchData()
        favouriteTableView.reloadData()
    }

    @objc func handleTap() {
            searchTextField.resignFirstResponder()
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

extension FavouritesViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        favouriteViewModel.favouritePosts = favouriteViewModel.searchData(with: textField.text!)
        favouriteTableView.reloadData()
        textField.resignFirstResponder()
        searchTextField.removeFromSuperview()
        return true
    }

}
