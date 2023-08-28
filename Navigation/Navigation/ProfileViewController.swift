//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Максим Жуин on 26.08.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    lazy var sunSymbol: UIImage = {
        let configuration = UIImage.SymbolConfiguration(font: UIFont.systemFont(ofSize: 12), scale: .large)
        let image = UIImage(systemName: "sun.max.fill", withConfiguration: configuration)
        if let image {
            self.sunSymbol = image
        }
        return sunSymbol
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Профиль"
        self.view.backgroundColor = .systemBackground
        self.tabBarItem = UITabBarItem(title: "Profile", image: sunSymbol, tag: 0)

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
