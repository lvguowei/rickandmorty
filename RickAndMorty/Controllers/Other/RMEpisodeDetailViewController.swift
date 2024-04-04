//
//  RMEpisodeDetailViewController.swift
//  RickAndMorty
//
//  Created by Guowei Lv on 15.3.2024.
//

import UIKit

class RMEpisodeDetailViewController: UIViewController, RMEpisodeDetailViewViewModelDelegate {

    private let viewModel: RMEpisodeDetailViewViewModel

    private let detailView: RMEpisodeDetailView = RMEpisodeDetailView()

    init(url: URL?) {
        self.viewModel = RMEpisodeDetailViewViewModel(endpointUrl: url)

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(detailView)
        addConstraints()
        title = "Episode"

        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .action, target: self, action: #selector(didTapShare))
        
        viewModel.delegate = self
        viewModel.fetchEpisodeData()

    }

    func didFetchEpisodeDetails() {
        detailView.configure(with: viewModel)
    }

    private func addConstraints() {
        NSLayoutConstraint.activate([
            detailView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            detailView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            detailView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            detailView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
        ])
    }

    @objc
    private func didTapShare() {

    }

}
