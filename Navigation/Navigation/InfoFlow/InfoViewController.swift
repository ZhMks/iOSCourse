//
//  InfoViewController.swift
//  Navigation
//
//  Created by Максим Жуин on 28.08.2023.
//

import UIKit

class InfoViewController: UIViewController {

    var infoVM: InfoViewModel

    private lazy var alertButton: UIButton = {
        let alertButton = UIButton(type: .system)
        alertButton.backgroundColor = .blue
        alertButton.translatesAutoresizingMaskIntoConstraints = false
        alertButton.setTitle("Present Alert", for: .normal)
        alertButton.setTitleColor(.white, for: .normal)
        alertButton.addTarget(self, action: #selector(tapOnAlertButton(_:)), for: .touchUpInside)
        return alertButton
    }()

    private lazy var titleLabel: UILabel = {
        let titleLable = UILabel()
        titleLable.translatesAutoresizingMaskIntoConstraints = false
        titleLable.text = "TEXTTEXT"
        return titleLable
    }()

    private lazy var orbitPeriod: UILabel = {
        let orbitPeriod = UILabel()
        orbitPeriod.translatesAutoresizingMaskIntoConstraints = false
        orbitPeriod.text = "Sample"
        return orbitPeriod
    }()

    private lazy var planetTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(PlanetTableViewCell.self, forCellReuseIdentifier: "PlanetTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()

    // MARK: -lifecycle

    init(infoVM: InfoViewModel) {
        self.infoVM = infoVM
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        alertButton.addTarget(self, action: #selector(animationForButton(_:)), for: .touchUpInside)
        setupUI()
        updateView()
    }

    // MARK: -func

    func setupUI() {
        let safeArea = view.safeAreaLayoutGuide
        view.addSubview(alertButton)
        view.addSubview(titleLabel)
        view.addSubview(orbitPeriod)
        view.addSubview(planetTableView)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 40),
            titleLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 25),
            titleLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -80),
            titleLabel.bottomAnchor.constraint(equalTo: orbitPeriod.topAnchor, constant: -40),

            orbitPeriod.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            orbitPeriod.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 25),
            orbitPeriod.bottomAnchor.constraint(equalTo: planetTableView.topAnchor, constant: -20),

            planetTableView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 200),
            planetTableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 25),
            planetTableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -40),
            planetTableView.bottomAnchor.constraint(equalTo: alertButton.topAnchor, constant: -50),

            alertButton.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -15),
            alertButton.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor)
        ])
    }

    @objc func animationForButton(_: UIButton) {
        UIView.animate(withDuration: 0.6) {
            self.alertButton.transform = CGAffineTransform(scaleX: 1.25, y: 1.25)
            self.alertButton.transform = CGAffineTransform(scaleX: 1, y: 1)
        }
    }

    @objc func tapOnAlertButton(_ sender: UIButton) {
        infoVM.currentState = { [weak self] state in
            switch state {
            case .green:
                DispatchQueue.main.async {
                    self?.planetTableView.reloadData()
                }
            case .red:
                print("red")
            case .initial:
                print("init")
            }
        }
    }

    func updateView() {
        titleLabel.text = infoVM.title
        orbitPeriod.text = "Orbital period is \(infoVM.planetInfo!.orbitPeriod) Days"
    }
}

extension InfoViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        infoVM.citizens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let cell = tableView.dequeueReusableCell(withIdentifier: "PlanetTableViewCell", for: indexPath) as? PlanetTableViewCell else { return UITableViewCell() }
        let currentCit = infoVM.citizens[indexPath.row]
        cell.configure(with: currentCit)
        return cell
    }
}
extension InfoViewController: UITableViewDelegate {}
