//
//  RMLocationView.swift
//  RickAndMorty
//
//  Created by Guowei Lv on 21.4.2024.
//

import UIKit

protocol RMLocationViewDelegate: AnyObject {
    func rmLocationView(_ locationView: RMLocationView, didSelect location: RMLocation)
}

class RMLocationView: UIView {

    public weak var delegate: RMLocationViewDelegate?

    private var viewModel: RMLocationViewViewModel? {
        didSet {
            spinner.stopAnimating()
            tableView.isHidden = false
            tableView.reloadData()
            UIView.animate(withDuration: 0.3) {
                self.tableView.alpha = 1
            }
        }
    }

    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(
            RMLocationTableViewCell.self,
            forCellReuseIdentifier: RMLocationTableViewCell.cellIdentifier)
        tableView.alpha = 0
        tableView.isHidden = true
        return tableView
    }()

    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView()
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.hidesWhenStopped = true

        return spinner
    }()

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        translatesAutoresizingMaskIntoConstraints = false
        addSubViews(tableView, spinner)
        spinner.startAnimating()
        addConstraints()
        configureTable()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    private func configureTable() {
        tableView.delegate = self
        tableView.dataSource = self
    }

    private func addConstraints() {
        NSLayoutConstraint.activate([
            spinner.heightAnchor.constraint(equalToConstant: 100),
            spinner.widthAnchor.constraint(equalToConstant: 100),
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor),

            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leftAnchor.constraint(equalTo: leftAnchor),
            tableView.rightAnchor.constraint(equalTo: rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }

    public func configure(with viewModel: RMLocationViewViewModel) {
        self.viewModel = viewModel
    }

}

extension RMLocationView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        // notify controller of selection
        guard let cellViewModels = viewModel?.cellViewModels else { fatalError() }
        let cellViewModel = cellViewModels[indexPath.row]

        guard let location = viewModel?.location(at: indexPath.row) else { return }

        delegate?.rmLocationView(self, didSelect: location)

    }

}

extension RMLocationView: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.cellViewModels.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellViewModels = viewModel?.cellViewModels else { fatalError() }
        guard
            let cell = tableView.dequeueReusableCell(
                withIdentifier: RMLocationTableViewCell.cellIdentifier, for: indexPath)
                as? RMLocationTableViewCell
        else { fatalError() }

        let cellViewModel = cellViewModels[indexPath.row]
        cell.configure(with: cellViewModel)
        return cell
    }

}
