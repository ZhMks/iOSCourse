//
//  FavouritesViewController.swift
//  Navigation
//
//  Created by Максим Жуин on 26.01.2024.
//

import UIKit
import CoreData

class FavouritesViewController: UIViewController {

    private lazy var fetchController: NSFetchedResultsController<FavouritePosts> = {
        let request = favouriteViewModel.favouriteService.request
        let context = favouriteViewModel.favouriteService.coreDataService.context
        let sortDescriptor = [NSSortDescriptor(key: "authorName", ascending: true)]
        request.sortDescriptors = sortDescriptor
        let fetchController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: context , sectionNameKeyPath: nil, cacheName: nil)
        fetchController.delegate = self
        return fetchController
    }()

    private var favouriteViewModel: FavouritesViewModel

    private lazy var searchTextField: UITextField = {
        let searchText = UITextField(frame: CGRect(x: 180, y: 100, width: 200, height: 30))
        searchText.borderStyle = .roundedRect
        searchText.font = UIFont.systemFont(ofSize: 16)
        searchText.placeholder = "Search"
        searchText.textColor = ColorCreator.textColor
        searchText.backgroundColor = UIColor.systemBackground
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
        view.backgroundColor = ColorCreator.themeColor
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
                do {
                    try fetchController.performFetch()
                    favouriteTableView.reloadData()
                } catch {
                    print("Error performing fetch: \(error)")
                }
            case .red:
                favouriteTableView.isHidden = true
                for button in navigationItem.rightBarButtonItems! {
                    button.isEnabled = false
                }
            case .initial:
                favouriteTableView.isHidden = true
                for button in navigationItem.rightBarButtonItems! {
                    button.isEnabled = false
                }
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
        fetchController.fetchRequest.predicate = nil
        do {
            try fetchController.performFetch()
            favouriteTableView.reloadData()
        } catch {
            print(error.localizedDescription)
        }
        searchTextField.text = ""
        searchTextField.becomeFirstResponder()
        favouriteTableView.reloadData()
    }

    @objc func handleTap() {
        searchTextField.resignFirstResponder()
    }
}

extension FavouritesViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let favouritePost = fetchController.object(at: indexPath)
            favouriteViewModel.favouriteService.delete(post: favouritePost)
        }
    }

}

extension FavouritesViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchController.sections?[section].numberOfObjects ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.id, for: indexPath) as? PostTableViewCell else { return UITableViewCell() }
        let infoForCell = fetchController.object(at: indexPath)
        cell.configure(author: infoForCell.authorName!,
                       title: infoForCell.postText!,
                       imageName: infoForCell.image!,
                       likes: Int(infoForCell.numberOfLikes),
                       views: Int(infoForCell.numberOfViews))
        return cell
    }
}

extension FavouritesViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        fetchController.fetchRequest.predicate = NSPredicate.init(format: "authorName CONTAINS %@", textField.text!)
        do {
            try fetchController.performFetch()
            favouriteTableView.reloadData()
        } catch {
            print(error.localizedDescription)
        }
        textField.resignFirstResponder()
        searchTextField.removeFromSuperview()
        return true
    }

}

extension FavouritesViewController: NSFetchedResultsControllerDelegate {

    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            guard let newIndexPath else { return }
            DispatchQueue.main.async {
                self.favouriteTableView.insertRows(at: [newIndexPath], with: .automatic)
            }
        case .delete:
            guard let indexPath else { return }
            DispatchQueue.main.async {
                self.favouriteTableView.deleteRows(at: [indexPath], with: .fade)
            }
        case .move:
            guard let newIndexPath, let indexPath else { return }
            DispatchQueue.main.async {
                self.favouriteTableView.moveRow(at: indexPath, to: newIndexPath)
            }
        case .update:
            guard let indexPath else { return }
            DispatchQueue.main.async {
                self.favouriteTableView.reloadRows(at: [indexPath], with: .automatic)
            }
        @unknown default:
            assertionFailure("ERROR")
        }
    }
}

