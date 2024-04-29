//
//  RMLocationViewController.swift
//  RickAndMorty
//
//  Created by Guowei Lv on 10.1.2024.
//

import UIKit

final class RMLocationViewController: UIViewController, RMLocationViewViewModelDelegate,
    RMLocationViewDelegate
{

    private let primaryView = RMLocationView()

    private let viewModel = RMLocationViewViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(primaryView)
        primaryView.delegate = self
        title = "Locations"
        addSearchButton()
        addConstraints()
        viewModel.delegate = self
        viewModel.fetchLocations()
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

    // MARK: - LocationViewModel delegate
    func didFetchInitialLocations() {
        primaryView.configure(with: viewModel)
    }

    // MARK: - RMLocationView delegate

    func rmLocationView(_ locationView: RMLocationView, didSelect location: RMLocation) {

        let vc = RMLocationDetailViewController(location: location)

        vc.navigationItem.largeTitleDisplayMode = .never

        navigationController?.pushViewController(vc, animated: true)
    }

}
