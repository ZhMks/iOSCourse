//
//  UiAllertViewController.swift
//  Navigation
//
//  Created by Максим Жуин on 28.08.2023.
//

import UIKit

class UIAllertViewController: UIViewController {
    lazy var redButton = UIButton(type: .system)
    lazy var blackButton = UIButton(type: .system)
    lazy var titleMessage = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        view.addSubview(redButton)
        view.addSubview(blackButton)
        view.addSubview(titleMessage)
        titleMessageLabelChage()
        blackButtonChange()
        redButtonChange()
        redButton.addTarget(self, action: #selector(redButtonTouched(_:)), for: .touchUpInside)
        blackButton.addTarget(self, action: #selector(blackButtonTouched(_:)), for: .touchUpInside)

        // Do any additional setup after loading the view.
    }
    
    func blackButtonChange() {
        blackButton.translatesAutoresizingMaskIntoConstraints = false
        blackButton.setTitle("Black Button", for: .normal)
        blackButton.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        blackButton.setTitleColor(.white, for: .normal)
        blackButton.layer.borderColor = UIColor(named: "black")?.cgColor
        blackButton.backgroundColor = .black
        blackButton.layer.borderWidth = 0.5
        
        let safeArealayoutGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            blackButton.topAnchor.constraint(equalTo: safeArealayoutGuide.topAnchor, constant: 400),
            blackButton.bottomAnchor.constraint(equalTo: safeArealayoutGuide.bottomAnchor, constant: -200),
            blackButton.leadingAnchor.constraint(equalTo: safeArealayoutGuide.leadingAnchor, constant: 50),
            blackButton.trailingAnchor.constraint(equalTo: safeArealayoutGuide.trailingAnchor, constant: -50)
        ])
    }
    
    func redButtonChange() {
        redButton.translatesAutoresizingMaskIntoConstraints = false
        redButton.setTitle("Red Button", for: .normal)
        redButton.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        redButton.setTitleColor(.black, for: .normal)
        redButton.layer.borderColor = UIColor(named: "black")?.cgColor
        redButton.backgroundColor = .red
        redButton.layer.borderWidth = 0.5
        
        let safeArealayoutGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            redButton.topAnchor.constraint(equalTo: safeArealayoutGuide.topAnchor, constant: 200),
            redButton.bottomAnchor.constraint(equalTo: safeArealayoutGuide.bottomAnchor, constant: -400),
            redButton.leadingAnchor.constraint(equalTo: safeArealayoutGuide.leadingAnchor, constant: 50),
            redButton.trailingAnchor.constraint(equalTo: safeArealayoutGuide.trailingAnchor, constant: -50)
        ])
    }
    
    func titleMessageLabelChage() {
        titleMessage.translatesAutoresizingMaskIntoConstraints = false
        titleMessage.text = "Last View"
        titleMessage.font = UIFont.systemFont(ofSize: 32)
        titleMessage.textColor = .black
        
        let safeArealayoutGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            titleMessage.topAnchor.constraint(equalTo: safeArealayoutGuide.topAnchor, constant: 40),
            titleMessage.leadingAnchor.constraint(equalTo: safeArealayoutGuide.leadingAnchor, constant: 130),
            titleMessage.trailingAnchor.constraint(equalTo: safeArealayoutGuide.trailingAnchor, constant: -100)
        ])
    }
    
    @objc func redButtonTouched(_: UIButton) {
        print("Red BUTTON TOUCHED")
    }
    
    @objc func blackButtonTouched(_: UIButton) {
        print("Black BUTTON TOUCHED")
    }
}
