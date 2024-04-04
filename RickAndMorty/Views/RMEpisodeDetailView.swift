//
//  RMEpisodeDetailView.swift
//  RickAndMorty
//
//  Created by Guowei Lv on 16.3.2024.
//

import Foundation
import UIKit

final class RMEpisodeDetailView: UIView {

    private var viewModel: RMEpisodeDetailViewViewModel?

    private var collectionView: UICollectionView?

    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView()
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner

    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemRed
        self.collectionView = createCollectionView()
        addConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    private func createCollectionView() -> UICollectionView {

    }

    private func addConstraints() {
        NSLayoutConstraint.activate([])
    }

    public func configure(with viewModel: RMEpisodeDetailViewViewModel) {
        self.viewModel = viewModel
    }
}
