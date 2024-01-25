//
//  RMCharacterViewController.swift
//  RickAndMorty
//
//  Created by Guowei Lv on 10.1.2024.
//

import UIKit

final class RMCharacterViewController: UIViewController {

    private let characterListView = RMCharacterListView()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Characters"
        view.backgroundColor = .systemBackground
        setupView()
    }

    private func setupView() {
        view.addSubview(characterListView)
        NSLayoutConstraint.activate([
            characterListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            characterListView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            characterListView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            characterListView.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
