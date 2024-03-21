//
//  PostViewController.swift
//  Navigation
//
//  Created by Максим Жуин on 27.08.2023.
//

import UIKit

class PostViewController: UIViewController {

    let viewModel: PostViewModel

    init(viewModel: PostViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ColorCreator.themeColor
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: NSLocalizedString("Info",
                                                                                     tableName: "Localizable",
                                                                                     comment: ""),
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(barButtonPressed(_:)))
    }

    @objc func barButtonPressed(_ sender: UIBarButtonItem) {
        viewModel.showInfoVC?()
    }
}
