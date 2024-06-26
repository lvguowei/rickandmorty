//
//  RMSearchViewController.swift
//  RickAndMorty
//
//  Created by Guowei Lv on 2.4.2024.
//

import UIKit

class RMSearchViewController: UIViewController {

    struct Config {
        enum `Type` {
            case character  // name | status | gender
            case episode  // name
            case location  // name | type

            var title: String {
                switch self {
                    case .character:
                        return "Search characters"
                    case .location:
                        return "Search Location"
                    case .episode:
                        return "Search Episode"
                }
            }
        }
        let type: `Type`

    }

    private let viewModel: RMSearchViewViewModel
    private let searchView: RMSearchView

    // MARK: - Init
    init(config: Config) {
        let viewModel = RMSearchViewViewModel(config: config)
        self.viewModel = viewModel
        self.searchView = RMSearchView(frame: .zero, viewModel: viewModel)
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel.config.type.title
        view.backgroundColor = .systemBackground
        view.addSubview(searchView)
        addConstraints()

        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Search", style: .done, target: self, action: #selector(didTapExecuteSearch))

        searchView.delegate = self
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        searchView.presentKeyboard()
    }

    @objc
    private func didTapExecuteSearch() {
        viewModel.executeSearch()
    }

    private func addConstraints() {
        NSLayoutConstraint.activate([
            searchView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            searchView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            searchView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

        ])
    }
}

extension RMSearchViewController: RMSearchViewDelegate {
    func rmSearchView(
        _ searchView: RMSearchView, didSelectOption option: RMSearchInputViewViewModel.DynamicOption
    ) {
        let vc = RMSearchOptionPickerViewController(option: option) { [weak self] selection in
            DispatchQueue.main.async {
                self?.viewModel.set(value: selection, for: option)
            }
        }

        vc.sheetPresentationController?.detents = [.medium()]
        vc.sheetPresentationController?.prefersGrabberVisible = true
        present(vc, animated: true)

    }
}
