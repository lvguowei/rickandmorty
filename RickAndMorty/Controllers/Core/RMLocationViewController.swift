//
//  RMLocationViewController.swift
//  RickAndMorty
//
//  Created by Guowei Lv on 10.1.2024.
//

import UIKit

final class RMLocationViewController: UIViewController {

    private let primaryView = RMLocationView()
    
    private let viewModel = RMLocationViewViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(primaryView)
        title = "Locations"
        addSearchButton()
        addConstraints()
    }

    private func addSearchButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .search, target: self, action: #selector(didTapSearch))
    }

    @objc private func didTapSearch() {

    }

    private func addConstraints() {
        NSLayoutConstraint.activate([
            primaryView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            primaryView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            primaryView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            primaryView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }

}
